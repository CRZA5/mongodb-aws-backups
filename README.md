# MongoDB AWS Backups

| Environment Variable  | Description                                                                                            | Default         |
|-----------------------|--------------------------------------------------------------------------------------------------------|-----------------|
| MONGO_USERNAME        | Username of the MongoDB user being used to backup                                                      |                 |
| MONGO_PASSWORD        | Password to authenticate with MONGO_USER                                                               |                 |
| MONGO_AUTH_DATABASE   | Database to use for authentication                                                                     |                 |
| MONGO_HOST            | IP/Hostname of the MongoDB Server                                                                      | 127.0.0.1       |
| MONGO_PORT            | Port where the MongoDB server is listening                                                             | 27017           |
| MONGO_DATABASES       | Database names that need to be backed up (split by ",") ie. `my_database,my_other_database`            | (all databases) |
| MONGO_VERBOSE         | Whether to output full logs of the dump commands                                                       | false           | 
| AWS_ENDPOINT          | **REQUIRED** S3 Compatible endpoint to upload the backup file to                                       |                 |
| AWS_ACCESS_KEY_ID     | **REQUIRED** AccessKeyId of the user being used to upload the file                                     |                 |
| AWS_SECRET_ACCESS_KEY | **REQUIRED** SecretAccessKey of the user being used to upload the file                                 |                 |
| AWS_DEFAULT_REGION    | The AWS region used to upload the backup.                                                              | eu-central-1    |
| AWS_BUCKET            | **REQUIRED** The name of the bucket where backups are uploaded                                         |                 |
| AWS_BUCKET_PATH       | The prefix of the file name (ie /production/)                                                          | /               |
| HEARTBEAT_URL         | An endpoint to send a HTTP request to as a ping upon successful backup. Can be used to create monitor. |                 |