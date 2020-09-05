# Setup AWS Config

```
$ cat ~/.aws/credentials 
[default]
aws_secret_access_key = SECRET_ACCESS_KEY
aws_access_key_id = ACCESS_KEY_ID

```

# Steps To Update BerryNet Repository 

1. Create `<git-to-s3>/git_to_s3_temp/` (indicated in `settings.py`)
1. Put new files into temp dir
  1. Update local repository

    ```
    $ dput berrynet <changes-file>
    ```

  1. Copy updated files from repository to temp dir.
  1. Example result:

      ```
      $ tree git_to_s3_temp/
      git_to_s3_temp/
      └── stretch
          ├── berrynet_3.4.0-1_all.deb
          ├── berrynet_3.4.0-1_amd64.changes
          ├── berrynet-dashboard_3.4.0-1_all.deb
          ├── InRelease
          ├── Packages
          ├── Packages.bz2
          ├── Packages.gz
          ├── Packages.xz
          ├── python3-berrynet_3.4.0-1_all.deb
          ├── Release
          ├── Release.gpg
          └── Sources.gz
    
      1 directory, 12 files
      ```
      
1. Run uploader (`git_to_s3.py`)

    * Uploader will upload dirs and files onto S3 indicated bucket.

1. Go to S3 bucket and re-make it public
  * Click stretch
  * Click Actions
  * Click Make public

# Automation

* [Get bucket obj list](https://stackoverflow.com/questions/42809096/difference-in-boto3-between-resource-client-and-session)
* Make folder public
  * [1](https://stackoverflow.com/questions/32395687/using-boto3-and-python-how-make-a-folder-public)
  * [2](https://stackoverflow.com/questions/41904806/how-to-upload-a-file-to-s3-and-make-it-public-using-boto3)
