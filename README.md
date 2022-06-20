# MongoDB AWS Backups

| Environment Variable  | Description                                                                                              | Default         |
|-----------------------|----------------------------------------------------------------------------------------------------------|-----------------|
| MONGO_USERNAME        | Username of the MongoDB user being used to backup                                                        |                 |
| MONGO_PASSWORD        | Password to authenticate with MONGO_USER                                                                 |                 |
| MONGO_HOST            | IP/Hostname of the MongoDB Server                                                                        | 127.0.0.1       |
| MONGO_PORT            | Port where the MongoDB server is listening                                                               | 27017           |
| MONGO_DATABASES       | Database names that need to be backed up (split by ",") ie. `my_database,my_other_database`              | (all databases) |
| AWS_ENDPOINT          | **REQUIRED** S3 Compatible endpoint to upload the backup file to                                         |                 |
| AWS_ACCESS_KEY_ID     | **REQUIRED** AccessKeyId of the user being used to upload the file                                       |                 |
| AWS_SECRET_ACCESS_KEY | **REQUIRED** SecretAccessKey of the user being used to upload the file                                   |                 |
| AWS_DEFAULT_REGION    | The AWS region used to upload the backup.                                                                | eu-central-1    |
| AWS_BUCKET_PATH       | **REQUIRED** The name of the bucket where backups are uploaded                                           |                 |
| AWS_FILENAME_PREFIX   | The prefix of the file name (ie /production/)                                                            | /               |
