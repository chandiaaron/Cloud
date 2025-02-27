# Autoscaling - Cloud Watch

## What is Autoscaling 

Autoscaling is a cloud computing feature that automatically adjusts the amount of computing resources (like virtual machines or instances) based on the demand. The main goal of autoscaling is to ensure that an application has the right amount of resources to handle the workload at any given time, without over-provisioning (wasting resources) or under-provisioning (leading to performance issues).

## What is Cloud Watch

Amazon CloudWatch is a monitoring and observability service offered by AWS. It provides real-time visibility into the performance and health of AWS resources and applications. 
CloudWatch Dashboards enable you to create visual representations of your metrics and logs in customisable graphs and charts. Lets manually create one together before using the full potential of autoscaling.

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

# How to set up Autoscaling in AWS




### **Explanation**
1. **Auto Scaling Process**  
   - An **EC2 Instance** is created.  
   - An **AMI (Amazon Machine Image)** is made from this instance.  
   - A **Launch Template** is created using the AMI.  
   - The **Auto Scaling Group (ASG)** manages EC2 instances based on scaling needs.  
   - A **Scaling Policy** defines how and when instances scale.

2. **Load Balancer and High Availability**  
   - An **Elastic Load Balancer (ELB)** distributes traffic among instances.  
   - Currently, **Instance 1 and Instance 2** are handling requests.  
   - **Instance 3 is inactive** but will be launched by the Auto Scaling Group if demand increases.


I already have an instance and AMI set up first we are going create our **Launch Template**

## How to create a Launch Template 

![creating launch temp image](/Images/Lt.JPG)
- You should see under the instances area there is a sub link called Launch Template, we want to use that and we can click the orange button to create our LT. Below are my configurations  

## **Launch Template Configuration for Auto Scaling**

## **1. Software Image (AMI)**
- **AMI ID:** `ami-000f9c9f30752e5c4`
- **Description:** AMI created for the application instance.

## **2. Virtual Server Type (Instance Type)**
- **Instance Type:** `t2.micro`

## **3. Firewall (Security Group)**
- **Security Group Name:** `hmlr-aaron-app-sg`

## **4. Storage (Volumes)**
- **Number of Volumes:** `1`
- **Size:** `8 GiB`

## **5. User Data Script (Startup Configuration)**
To ensure the instance is properly configured when it launches, we use the following **User Data** script:

```bash
#!/bin/bash
cd /home/ubuntu
cd nodejs20-sparta-test-app-2025
cd app
sudo npm install
pm2 start app.js
```
This ensures that every new instance launched by the Auto Scaling Group is automatically set up with the correct dependencies and starts the application immediately. 

So it should be running now but we aren't finished yet as we want to do the following : 

![lt image](/Images/Lt2.JPG)

launching an instance from your Launch Template is important because we can make sure we have set the right configurations before using it in the auto scaling group. 

![lt image tag](/Images/Lt3.JPG)

we want to add a resource tag because it helps with identification, otherwise there would be no name. 

# Creating our Auto Scaling Group (ASG)

First we want to head over to this area on AWS and click the orange button to create out ASG : 

![creating ASG](/Images/Lt4.JPG)

### Selecting our Lt

In the first section we want to provide a name and select the launch template that we just created. 

![selecting our template in asg process](/Images/Lt5.JPG)

### Selecting our Availabilty Zones (AZs)

Choosing three Availability Zones (AZs) for your Auto Scaling Group (ASG) is a best practice because it improves:

1. High Availability (HA) 
If one AZ fails, the ASG will launch new instances in the other two AZs to keep your application running.
AWS Load Balancer will reroute traffic to healthy instances in other AZs.
2. Load Distribution 
When CPU usage spikes in one AZ, the ASG can distribute instances across multiple AZs to balance the load.
This prevents one AZ from being overloaded while others sit idle.
3. Fault Tolerance 
If AWS experiences an outage in one AZ, your app won’t go down because other AZs will still be operational.

![Selecting our AZs](/Images/Lt6.JPG)

Also at the bottom there is an option to pick **balanced best effort**, this will ensure that instances are spread across all AZs, so we will select that option. 

## Integrate with other services

![Integrate with other services](/Images/Lt7.1.JPG)
![Integrate with other services](/Images/Lt7.2.JPG)

- we are making a new load balancer 
- The application will use the following protocols as its a web based app 
- we provide a name for the load balancer
- we want it to be internet facing so users can access it 
- listeners are set to HTTP on port 80, accepts incoming traffic using that protocol
- No VPC Lattice service, our asg will function on its own without additional networking benefits 
- Lastly we want the elastic load balancer health check so only healthy instances are serving traffic. 

## Configure group size and scaling

![group scaling](/Images/Lt8.1.JPG)

![group scaling](/Images/Lt8.2.JPG)

- our desired capacity is 2, min = 2, and max is 3 but the third instance is inactive for now. 
- Target tracking scaling policy, in this case we are tracking cpu usage. If it surges above 50 percent then we can direct traffic to another instance. 
- The rest is default for now 


- we can skip add notifications 

## Add tags 

This is very important becasue we can track our asg across AWS otherwise it would be nameless and we dont to run too many instances without names. 

![tag](/Images/Lt9.JPG)


We can now check everything and if you are happy with your settings we can click launch. Using the Lb DNS we can check if our app is up and running. 