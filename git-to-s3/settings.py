"""
Settings file for git-to-s3
"""

import os


# Parent dirpath of the git-to-s3 dir.
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# The temporary directory the git repository will be cloned to locally.
TEMP_DIRECTORY = os.path.join(BASE_DIR, 'git-to-s3/git_to_s3_temp')

# Source repository which will be uploaded to S3 bucket.
# BerryNet project does not use this feature and disables it.
#GIT_URL = 'file:///home/bafu/codes/BerryNet-repo'

# Target S3 bucket to host BerryNet repository
AWS_STORAGE_BUCKET_NAME = 'repo.berrynet.org'
