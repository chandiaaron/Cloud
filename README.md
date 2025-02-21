# Cloud Computing

## What is Cloud Computing? 

Cloud computing is the delivery of computing services like storage, processing, and software over the internet, allowing users to access resources on demand without needing physical infrastructure. 

## How do we know if something is in the cloud?

Something is in the cloud if it is stored, processed, or run on remote servers accessed via the internet rather than on a local device. If you can reach it from multiple devices without needing specific hardware, its likely cloud based. 

![cloud computing infrastructure Image](/Images/cloudpic.png)   

## What is the difference between On-Prem and Cloud?

#### On-Prem:
- Computing resources are hosted and managed within a company's own physical infrastrcure like servres. The company is resposnible for overall maintenance. 

#### Cloud:
- Computing resoruces are hosted on remote servers managed by a cloud provider, like AWS, via the internet. The provider hnadles infrastrucure and overall maintenance. 

![On-Prem vs Cloud Image](/Images/cloudpic2.JPG)

## Cloud Deployment Models 

### 1. Public Cloud
- Services provided by third-party providers (e.g., AWS, Azure, Google Cloud).
- Shared infrastructure across multiple customers.
- Cost-effective, scalable, and managed by the provider.

### 2. Private Cloud
- Dedicated infrastructure for a single organization.
- Can be hosted on-premises or by a third-party provider.
- Offers greater control, security, and customization but requires more management.

### 3. Hybrid Cloud
- Combination of public and private cloud environments.
- Allows data and applications to move between them.
- Provides flexibility, scalability, and better disaster recovery options.

### 4. Community Cloud
- Shared infrastructure for organizations with common goals (e.g., government, healthcare).
- Balances cost, security, and compliance needs.

## Cloud Service Types

#### IaaS (Infrastructure as a Service):
- Provides virtualized computing resources over the internet (e.g., servers, storage, networking).
- Offers high flexibility and scalability without maintaining physical infrastructure.
- Examples: AWS EC2, Google Compute Engine, Microsoft Azure Virtual Machines.
 
#### PaaS (Platform as a Service):
- Provides a platform with tools and frameworks for developers to build, test, and deploy applications.
- Manages the underlying infrastructure, including OS, runtime, and databases.
- Examples: Google App Engine, AWS Elastic Beanstalk, Microsoft Azure App Services.

#### SaaS (Software as a Service):
- Delivers fully managed software applications over the internet.
- Users don’t manage infrastructure or platforms—just use the application.
- Examples: Google Workspace, Microsoft 365, Dropbox, Salesforce.

![IaaS Image](/Images/cloudpic4.JPG) 

#### FaaS (Function as a service)
- Allows developers to run code in response to events without managing servers.
- The cloud provider handles infrastructure, scaling, and execution.
- Ideal for microservices, event-driven applications, and automation.
- Examples: AWS Lambda, Google Cloud Functions, Azure Functions.

![Faas Image](/Images/cloudpic5.JPG)

### Key Differences: IaaS vs. PaaS vs. SaaS vs. FaaS

| Feature      | IaaS (Infrastructure as a Service) | PaaS (Platform as a Service) | SaaS (Software as a Service) | FaaS (Function as a Service) |
|-------------|-----------------------------------|-----------------------------|-----------------------------|-----------------------------|
| **Control**  | High (manages infrastructure)   | Medium (manages applications) | Low (only uses the software) | Very Low (executes code only) |
| **Flexibility** | High | Moderate | Low | High (event-driven, scales automatically) |
| **Maintenance** | User manages | Provider handles platform | Provider fully manages | Provider fully manages |
| **Use Case** | Hosting virtual machines, storage | Developing and deploying applications | End-user software (email, CRM, collaboration) | Running event-driven functions, microservices |


## The avantages and disadvantages of the Cloud

#### Advantages: 
- Off Hand maintenance - The cloud providers handle updates, patches and overall infrastrcure.
- Cost effective - You only pay for what you use and when you finished you stop paying instantly. 
- scalability - You can easily scale up resoruces. 

#### Disadvantages:
- Reliability - Cloud outages can disrupt bussiness operations.  
- Security - While cloud secuirty is generally good it still poses a cyber threat holding senseitive information in the cloud. 
- Vendor Contract - Migrating between cloud providers can be very time consuming and expensive 

## CapEX VS opEX 

#### Capital Expenditure (CapEx)
Upfront investment in physical assets like servers, data centers, or networking equipment.
Requires significant initial spending but may reduce long-term costs.
Example: Buying and setting up on-premises servers.
#### Operational Expenditure (OpEx)
Ongoing costs for day-to-day operations, including cloud services, software subscriptions, and maintenance.
Pay-as-you-go model provides flexibility and reduces initial investment.
Example: Paying for AWS, Azure, or Google Cloud resources on a monthly or usage-based basis.
#### How Does This Relate to Cloud?
On-Premises IT - More CapEx (buying servers, storage, and data centers).
<br/>Cloud Computing -  More OpEx (paying for usage, reducing upfront costs).
<br/> Cloud shifts IT spending from CapEx to OpEx, allowing businesses to scale efficiently and optimize costs.

#### Is moving to the cloud always beneficial

The advantages listed above are only a few examples of how moving to the cloud can be positive but it doesn't mean its always the right move. 
One way to mitigate some of the risks is by adpoting a Hybrid approach. combining on-prem and cloud infrastructure to balance cost, performance, and security.

## Market Share 

![Market Share Image](/Images/coudpic6)

#### Top 3 Cloud Providers and Their Strengths  

| Cloud Provider | Strengths | Known For | Popular Services | Best For |
|---------------|-----------|-----------|------------------|----------|
| **AWS (Amazon Web Services)** | Largest market share, widest range of services, strong global presence | Scalability, reliability, and vast ecosystem | EC2 (compute), S3 (storage), Lambda (serverless), RDS (databases) | Enterprises, startups, diverse cloud solutions |
| **Microsoft Azure** | Strong enterprise adoption, hybrid cloud integration, security & compliance | Integration with Microsoft products (Windows, Office 365) | Azure Virtual Machines, Azure Active Directory, Azure Kubernetes Service (AKS) | Large enterprises, hybrid cloud setups, Microsoft users |
| **Google Cloud (GCP)** | AI/ML leadership, big data analytics, Kubernetes expertise | Big data, machine learning, and developer-friendly tools | BigQuery (data analytics), Vertex AI (ML/AI), Google Kubernetes Engine (GKE) | AI/ML workloads, big data analytics, cloud-native apps |


## What can you pay for in the cloud? 

In AWS, AMI(Amazon Machine Image), is the software that contains everything you need to launch a vritual machine (EC2 Instance).