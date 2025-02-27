# Autoscaling - Cloud Watch

## What is Autoscaling 

Autoscaling is a cloud computing feature that automatically adjusts the amount of computing resources (like virtual machines or instances) based on the demand. The main goal of autoscaling is to ensure that an application has the right amount of resources to handle the workload at any given time, without over-provisioning (wasting resources) or under-provisioning (leading to performance issues).

## What is Cloud Watch

Amazon CloudWatch is a monitoring and observability service offered by AWS. It provides real-time visibility into the performance and health of AWS resources and applications. 

CloudWatch Dashboards enable you to create visual representations of your metrics and logs in customizable graphs and charts.

## How to set up a dashboard 

- Log into your AWS account 
- Click EC2, in this example I have already set up an instance for an app, so i will select that instance 
- scroll down and select the monitoring tab 
- click _Add to dashboard_

![monitor image](/Images/autoscalepic.JPG)
![add to dash image](/Images/autoscale2.JPG)

- It should open up another broswer, you are now in the cloud watch area of AWS 
- click _create new_  
- provide a name, click _create_
- finally click _Add to dashboard_

![create promt](/Images/autoscale3.JPG)
![dash board area](/Images/autoscale4.JPG)

## How to set up an Alarm 

In this example i will be focusing on the cpu metric. 

- Click the three dots on the CPU metric and scroll down and select _view in metrics_ 
- In the actions area you will see a little bell icon click that to create your first alarm 
- next we want to set our conditions like setting a threshold of > 50, so when a data point is above 50 percent within a certain time frame the alarm should go off  

![create alarm](/Images/autoscale5.JPG)
![create alarm bell icon](/Images/autoscale6.JPG)
![conditions setting](/Images/autoscale7.JPG)

### Configure actions 

- We want to create a send a notification topic 
- click _create new topic_
- provide a suitable name and email
- with the email you provided you will be promted to authenticate this process of setting up alarm  

![setting up notification](/Images/autoscale8.JPG)

# Add name and description 

- provide a name and description of the alarm 

your alarm is set up but you might notice it says insufficient data so lets fix that first. 

## Adding the dashbord 

you can click the alarm you just set up and then click actions to add to dashbord 

# Stress test 

im now going to go to my instance and download the stress package 

```GitBash
sudo apt update -y
sudo apt install stress -y 
```

I will then run my app 

```GitBash
pm2 start app.js
```
once my app is running i can then begin the stress test with the following command 

```GitBash
stress --cpu 1 --timeout 180 
```

if i want to increase the CPU load i can do this 

```GitBash
stress --cpu 2 --timeout 300
```

![stress test image](/Images/autoscale10.JPG)
![email noti image](/Images/autoscale11.JPG)

As you can see it loaded my cpu to the threshold and i got a notification on my email. 