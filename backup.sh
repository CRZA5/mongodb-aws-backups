#!/bin/bash
set -xe

INTERNAL_DATABASES=("local")

mkdir -p /tmp/dumps

FILENAME="mongodump_$(date +%F_%H-%M).tar.gz"

MONGO_ARGS="--host=${MONGO_HOST:-127.0.0.1} --port=${MONGO_PORT:-27017} ${MONGO_USERNAME:+-u=$MONGO_USERNAME} ${MONGO_PASSWORD:+-p=$MONGO_PASSWORD}"

echo Backing up databases to $FILENAME

if [[ -z "${MONGO_DATABASES}" ]]; then
    databases=$(mongo $MONGO_ARGS --quiet --eval 'db.adminCommand( { listDatabases: { authorizedDatabases: true } } ).databases.map(x => x.name).join("\n")')
else
    databases=$(echo $MONGO_DATABASES | tr "," "\n")
fi

if [[ -z $MONGO_VERBOSE ]]; then
    MONGO_ARGS+=" --quiet"
fi

for database in $databases
do
    IS_INTERNAL=$(echo ${INTERNAL_DATABASES[@]} | grep -o $database | wc -w)

    if [[ $IS_INTERNAL -eq 1 ]]; then
        echo "Skipping internal database $database"
        continue
    fi

    echo Dumping $database

    mongodump $MONGO_ARGS --db=$database --archive=/tmp/dumps/$database.gz --gzip ${MONGO_QUIET:+--quiet}
done


tar cvzf $FILENAME -C /tmp/dumps .

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region ${AWS_DEFAULT_REGION:-eu-central-1}

aws s3 cp --endpoint-url=$AWS_ENDPOINT $FILENAME s3://${AWS_BUCKET}${AWS_BUCKET_PATH:=/}${FILENAME}
