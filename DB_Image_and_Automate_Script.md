# DB Image 

## How to Create a DB Image

First, make sure you are logged into your AWS account and navigate to the EC2 Dashboard. Click **Instances**. In this example, I already have a MongoDB instance running, so I will select that instance.

![AWS create an image from instance Image](/Images/dbpic.JPG)

Next, select **Actions**, then navigate to **Images and templates** > **Create Image**.

![AWS create an image from instance part two Image](/Images/dbpic2.JPG)

Now, fill out the form as shown below. In this example, I will choose **Do not reboot** when starting.

![DB IMAGE](/Images/dbpic3.JPG)

Afterward, return to the EC2 Dashboard and launch a new instance.

![DB Image 2](/Images/dbpic4.JPG)

![DB Image 3](/Images/dbpic5.JPG)

Instead of clicking **Quick Start** when selecting your AMI, click **My AMIs**, and then search for the image that we just created. Other settings, such as your key pair and security group policy, should be set up as usual. Remember, this is for a database, so make sure to select the appropriate security group.

# How to run your script in your Image 

Once you have your image and dedicated file present we can run scripts to automate the manual process : 

```GitBash
scp -i /c/Users/Aaron/.ssh/hmlr-aaron-aws-key.pem /c/Users/Aaron/sparta_training/cloud_computing/my_scripts/ ubuntu@<ip of image instance>:/home/ubuntu/
```