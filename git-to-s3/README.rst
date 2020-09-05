git-to-s3
============

Upload your entire git repository to AWS S3.  Very useful for static webites hosted on S3.
Built for Python3 and tested for Windows and Unix.


Usage
-------------------------
1. Clone the repository

2. Create a virtualenv

3. Install Python dependencies ``pip install -r requirements.txt``

4. Set up AWS credentials in ``.aws/credentials`` file (or using AWS CLI):
 
 Unix: ``~/.aws/credentials``
 
 Windows: ``C:\Users\Username\.aws\credentials``
 

 In this file put the following:

 ``[default]``

 ``aws_access_key_id = YOUR_ACCESS_KEY``

 ``aws_secret_access_key = YOUR_SECRET_KEY``

 ``[default]``

 ``region=us-east-1``
 
5. Edit the settings.py to include your S3 bucket name and git repository URL

6. Run ``python git_to_s3.py``
