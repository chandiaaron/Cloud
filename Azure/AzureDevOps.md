# Azure Boards 

Sprint - Short, time-boxed period when a team completes a planned amount of work 

## How to connect your Boards to Github 

![boards linked to Github](/Images/az1.JPG)

![boards linked to Github](/Images/az2.JPG)

## How to import a repo 

![importing a repo from Github](/Images/az3.JPG)

![importing a repo from Github](/Images/az4.JPG)

## Making another branch and merging into the main branch 

- First we want to make a new branch, I have already made one : 

![Branch](/Images/az5.JPG)

- we can edit our file and preview them : 

![importing a repo from Github](/Images/az6.JPG)

- Once we are happy with the changes we can commit them, leaving a comment helps : 

![importing a repo from Github](/Images/az7.JPG)

- we can create a pull request before merging into the main branch
- we can edit the pull request so people can review it before merging 

![importing a repo from Github](/Images/az8.JPG)
![importing a repo from Github](/Images/az9.JPG)

- for those reviewing our request they can leave comments and if they are happy they can approve the edit
  and complete the merge 

![importing a repo from Github](/Images/az10.JPG)

- if we check our main branch we should now see our edits : 

![importing a repo from Github](/Images/az11.JPG)

## how to export repo locally and create changes  

- select the repo you want to clone : 

![importing a repo from Github](/Images/az12.JPG)

- You can generate git credentials which will provide a password if your ide prompts you to put one in. 

- when your repo is cloned over we can make another branch in the search bar using : 

```
>git create branch 
```

we check which branch we are in by looking in the bottom left corner 

- next we can make a small edit to any of the files and commit that change with a message using source control on the left
- to push these changes back to the azure repo we can click the little cloud icon in the bottom left which is normally a cycle icon  

![importing a repo from Github](/Images/az28.JPG)

- It worked because back in our azure devops environment we can see a pull request
- we can edit and submit that request, we can approve and complete the full merge back into the main branch 

![importing a repo from Github](/Images/az29.JPG)

![importing a repo from Github](/Images/az30.JPG)

## How to revert any commits 

- if we go to the commit node we can see all of the history 

![importing a repo from Github](/Images/az13.JPG)

- if you want to `revert` a change then we can simply : 

![importing a repo from Github](/Images/az14.JPG)

- This will create another pull request, so we can review and commit and it should update our `main` branch 

# Build and Deploy Code with Azure Pipelines 

Azure pipelines is a cloud-based service that helps automate the process of building, testing, and deploying code. It supports CI/CD, enabling teams to deliver software faster and with higher quality. 

Pipeline 

- Executes the continuous integration process 
- Runs tasks when you submit code 
- Uses a build agent 
- Creates a build artifact 

Artifact examples : 

- Java app packaged in a .zip file 
- C++ or javaScript library 
- A vm or Docker image 


### **Pipeline**

1. **Executes the continuous integration process**  
   - Continuous Integration (CI) is a practice where developers frequently merge their code changes into a shared repository. Azure Pipelines automatically builds and tests the code after each merge to ensure that the new changes do not break the existing functionality.  
   - This helps catch bugs early in the development cycle and ensures that the codebase remains stable.

2. **Runs tasks when you submit code**  
   - A pipeline consists of a series of tasks or steps that are executed sequentially or in parallel.  
   - For example, tasks can include compiling code, running unit tests, packaging the application, or deploying it to a staging environment.  
   - These tasks are triggered automatically when you push code to the repository or create a pull request.

3. **Uses a build agent**  
   - A build agent is a machine (virtual or physical) that executes the tasks defined in the pipeline.  
   - Azure Pipelines provides hosted agents (managed by Microsoft) or allows you to configure self-hosted agents (managed by your team).  
   - The agent downloads the code, runs the build scripts, and uploads the results (e.g., build artifacts).

4. **Creates a build artifact**  
   - A build artifact is the output of the build process. It is a packaged version of your application or library that is ready for deployment or further testing.  
   - Artifacts can include compiled binaries, Docker images, or other files required for deployment.  
   - These artifacts are stored and can be used in subsequent stages of the pipeline, such as deployment.

---


 **Java app packaged in a .zip file**  
   - For Java applications, the build process might produce a `.jar` or `.war` file, which is then packaged into a `.zip` file for easy distribution or deployment.



---

By automating these processes, Azure Pipelines ensures that your code is always in a deployable state, reduces manual effort, and accelerates the delivery of new features and fixes.


![importing a repo from Github](/Images/az15.JPG)

## Build Pipeline 

![importing a repo from Github](/Images/az16.JPG)

## Release Pipeline 

![importing a repo from Github](/Images/az17.JPG)

## Agents 

![importing a repo from Github](/Images/az18.JPG)


# Building our first pipeline 

YAML - is a human-readable data serialization standard, often used to write configuration files 

`serialization` - translates data structures or object state into a format that can be stored and reconstructed later in a different computer environment, `config as code `. 


## Our first build Azure repo : 

- we can click pipeline : 

![importing a repo from Github](/Images/az19.JPG)

- we are creating one using azure repo so we will select that 

![importing a repo from Github](/Images/az20.JPG)

- Next we can review our YAML code for our build and if we are happy then we can click `Run` :

This YAML code defines a **starter pipeline** for Azure Pipelines

### **Code Explanation - build pipeline**

```yaml
trigger:
- main
```
- **`trigger`**: Specifies the branch that triggers the pipeline.  
  - In this case, the pipeline will run automatically whenever changes are pushed to the `main` branch.

---

```yaml
pool:
  vmImage: ubuntu-latest
```
- **`pool`**: Defines the build agent pool to use for running the pipeline.  
  - **`vmImage: ubuntu-latest`**: Specifies that the pipeline will use a virtual machine with the latest version of Ubuntu as the build agent.

---

```yaml
steps:
- script: echo Hello, world!
  displayName: 'Run a one-line script'
```
- **`steps`**: Lists the tasks or actions to be performed in the pipeline.  
  - **`script`**: Runs a shell command or script.  
  - **`echo Hello, world!`**: Outputs the text "Hello, world!" to the console.  
  - **`displayName`**: Provides a human-readable name for the step, which will appear in the pipeline logs.

---

```yaml
- script: |
    echo Add other tasks to build, test, and deploy your project.
    echo See https://aka.ms/yaml
  displayName: 'Run a multi-line script'
```
- This step runs a **multi-line script**.  
  - **`|`**: Indicates that the script spans multiple lines.  
  - The script outputs two lines of text to the console:
    - "Add other tasks to build, test, and deploy your project."
    - "See https://aka.ms/yaml" (a link to Azure Pipelines documentation).  
  - **`displayName`**: Describes this step as "Run a multi-line script."

---

### **Summary**
This pipeline:
1. Runs automatically when changes are pushed to the `main` branch.
2. Uses an Ubuntu-based virtual machine as the build agent.
3. Executes two steps:
   - A one-line script that prints "Hello, world!".
   - A multi-line script that provides guidance on adding tasks for building, testing, and deploying.

This is a basic template that can be extended by adding more steps to build, test, and deploy your project.


![importing a repo from Github](/Images/az21.JPG)


# building a pipeline with Github 

- its the same process as above but you pick github and you need to make sure you install azure pipelines using market place on github 


# Set up your release pipeline 

- In the pipeline tab click release and click new 

![importing a repo from Github](/Images/az22.JPG)

- The artifact is the what? 
- The stages are the where and how ?

![importing a repo from Github](/Images/az23.JPG)


#### configuring stage 1 on Azure 

![importing a repo from Github](/Images/az24.JPG)

- we can get the following information by setting it up on Azure 

![importing a repo from Github](/Images/az25.JPG)

- next we have to set up our artifact which is our build pipeline 

![importing a repo from Github](/Images/az26.JPG)

- finally we can click release 


## The importance of a service connection 

A service connection in Azure DevOps is a crucial component that enables secure communication between your pipeline and Azure services. Here's why it's important:

### Key Purposes

1. **Enables Authentication**
   - Provides secure authentication between Azure DevOps and other services
   - Allows pipelines to securely access and interact with external services
   - Prevents exposure of sensitive credentials in code

2. **Manages Permissions**
   - Controls what permissions your pipeline has when interacting with Azure resources
   - Follows the principle of least privilege
   - Ensures pipelines only have necessary permissions for their tasks

3. **Facilitates Deployment**
   - Enables pipelines to:
     - Access Azure resources
     - Deploy applications
     - Manage Azure services
     - Configure settings

4. **Secures Credentials**
   - Securely stores sensitive information (passwords, API keys)
   - Manages credential lifecycle
   - Prevents credential exposure in pipeline code

### Example Use Case
When deploying a web application to Azure App Service, a service connection is required to:
- Authenticate with Azure
- Access your subscription
- Deploy your application
- Configure app settings
- Manage the App Service

Without a service connection, your pipeline cannot securely interact with Azure services, making automated deployments and configurations impossible.

#### How to set up a service connection 

- Head over to general settings at the bottom of the page 
- scroll down and click service connection 
- set up a new connection by clicking `Azure Resource Manager`
- select `Service Principal` (recommended)

![importing a repo from Github](/Images/az27.JPG)


# Creating the full pipeline in one go 

- First lets set up our Azure Cloud Environment, we want to create a web app : 

![importing a repo from Github](/Images/az32.JPG)

- Next we want to go back to Azure DevOps and create a service connection : 

![importing a repo from Github](/Images/az34.JPG)

- We can create our new pipeline, we don't need to set up a release pipeline as our yaml code will configure everything into one build : 

Select Azures repos git 
Select the file we have been working on 
update the YAML code : 

### Complete Pipeline YAML Example

Here's a complete example of a pipeline that builds and deploys a Node.js app to Azure:

```yaml
# Node.js Express Web App to Linux on Azure
# Build a Node.js Express app and deploy it to Azure as a Linux web app.
# Add steps that analyze code, save build artifacts, deploy, and more:
# https://docs.microsoft.com/azure/devops/pipelines/languages/javascript
trigger:
- master
variables:
  # Azure Resource Manager connection created during pipeline creation
  azureSubscription: 'hmlr-app-sc'
  
  # Web app name
  webAppName: 'hmlrmywebapp'
  
  # Resource group
  resourceGroupName: 'hmlr-aaron-RG'
  # Environment name
  environmentName: 'hmlrmywebapp'
  # Agent VM image name
  vmImageName: 'ubuntu-latest'
  
stages:
- stage: Archive
  displayName: Archive stage
  jobs:  
  - job: Archive
    displayName: Archive
    pool:
      vmImage: $(vmImageName)
    steps:   
    - task: AzureAppServiceSettings@1
      inputs:
        azureSubscription: $(azureSubscription)
        appName: $(webAppName)
        resourceGroupName: $(resourceGroupName)
        appSettings: |
          [
            {
              "name": "SCM_DO_BUILD_DURING_DEPLOYMENT",
              "value": "true"
            }
          ]
    - task: ArchiveFiles@2
      displayName: 'Archive files'
      inputs:
        rootFolderOrFile: '$(System.DefaultWorkingDirectory)'
        includeRootFolder: false
        archiveType: zip
        archiveFile: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
        replaceExistingArchive: true
    - upload: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
      artifact: drop
- stage: Deploy
  displayName: Deploy stage
  dependsOn: Archive
  condition: succeeded()
  jobs:
  - deployment: Deploy
    displayName: Deploy
    environment: $(environmentName)
    pool:
      vmImage: $(vmImageName)
    strategy:
      runOnce:
        deploy:
          steps:            
          - task: AzureWebApp@1
            displayName: 'Azure Web App Deploy: Matt-Test-NodeJS-Deploy'
            inputs:
              azureSubscription: $(azureSubscription)
              appType: webAppLinux
              appName: $(webAppName)
              runtimeStack: 'NODE|10.14'
              package: $(Pipeline.Workspace)/drop/$(Build.BuildId).zip
```

### Pipeline Components Explained

1. **Trigger Configuration**
   - The pipeline runs automatically when changes are pushed to the `master` branch
   - This ensures your application is always up to date with the latest code

2. **Variables**
   - `azureSubscription`: Name of your Azure service connection
   - `webAppName`: Name of your Azure Web App
   - `resourceGroupName`: Azure resource group name
   - `environmentName`: Name of your deployment environment
   - `vmImageName`: The build agent's operating system image

3. **Archive Stage**
   - Configures Azure App Service settings
   - Packages your application files into a ZIP archive
   - Uploads the archive as a build artifact for deployment

4. **Deploy Stage**
   - Depends on successful completion of the Archive stage
   - Deploys the packaged application to Azure Web App
   - Uses Node 22 runtime stack
   - Configures the deployment as a Linux web app

This pipeline demonstrates a complete CI/CD workflow, from building to deploying your application to Azure.


# Creating an Azure DevOps Pipeline via IDE 

- Make sure you have these extensions installed 

![importing a repo from Github](/Images/az35.JPG)

- Azure account is very important 
- once we have made edits to our file we can do the following : 

```
# in the ide search bar type the following 

>deploy to web app 

select your folder to zip and deploy which is the one you are working on 

create a new web app or select one you have already created 

you will be prompted to say yes or no 

click deploy 

```

# Deploying my own app 

general overview + plan 

- have the repo cloned on azure devops 
- create vm on azure devops 
- create service connection 
- create environment connection with vm 
- build and deploy pipeline 

CURRENT PROBLEMS TO FIX 

- automatically install dependencies correctly (PM2)
- figure out why the app doesn't instantly launch with pm2
- Connect Database  

# Guide 

- Create VM on Azure portal 

Make sure you allow inbound traffic for port 3000 

you can achieve this by configuring the networking settings within your VM 

Protocol = `TCP`

- import github repo to Azure DevOps 

- Create a service connection 

- Create a Personal Access Token (PAT) in Azure DevOps:

1. Go to Azure DevOps → User settings (top right) → Personal access tokens
2. Click "New Token"
3. Name: "VM Deployment Agent"
4. Organization: Select your organization
5. Expiration: Set as needed
6. Scopes: Select "Agent Pools (read, manage)" and "Deployment Groups (read, manage)"
7. Click "Create" and copy the token (you'll only see it once)


- Create a Deployment Group in Azure DevOps: 

1. Within the Pipeline tab click Environment 
2. we want to create a new deployment group 
- resource type would be `Virtual Machine` 
3. Name: `VM-Deployment-Group`
4. Description: `Deployment group for Azure VM` 
5. click `create`

- On the next screen you will see a script provided to you, run this in your terminal to create that connection 


#### when in VM 

You will be prompted with the following : 

```Bash 
Enter Comma separated list of tags (e.g web, db) >

# you can put web or something that is relatable to your deployment 

```

![importing a repo from Github](/Images/az36.png)


## YAML Variables to Update

This will change from time to time depending on the variables you have set up 

- **azureSubscription**
  - **Where to find it**: Project Settings > Service connections
  - **Description**: Look for the name of your service connection (e.g., "AzureServiceConnection").

- **environment name**
  - **Where to find it**: Pipelines > Environments
  - **Description**: This is the name you gave your environment when you created it (e.g., "VM-Deployment-Group").

- **VM tags**
  - **Where to find it**: Pipelines > Environments > [Your Environment] > Virtual machines
  - **Description**: These are the tags you entered when registering your VM (e.g., "web").

- **VM username**
  - **Description**: This is your username on the Azure VM (e.g., "azureuser").
  - **Verification**: You can verify this by checking who you're logged in as when you SSH into your VM.

- **Application path**
  - **Where to find it**: In the GitHub repository structure.
  - **Description**: Check if the code is in the root directory or in an "app" subfolder. Update the `cd app` part if your code is in a different location.

- **Application entry point**
  - **Where to find it**: In the `package.json` file of your application.
  - **Description**: Look for the "main" field or the "start" script in the "scripts" section. Update `node app.js` if your entry point is different.


# Current Code - Work in Progress 

  ```YAML

  trigger:
- main  # The pipeline triggers on changes to the 'main' branch

variables:
  azureSubscription: 'SpartaApp-Azure-SC'  # Your service connection name
  resourceGroupName: 'HMLR-upskilling'  # Your resource group
  environmentName: 'VM-Deployment-Group'  # Environment name
  vmImageName: 'ubuntu-latest'  # Agent VM image name for the build agent

stages:
- stage: Build  # Define the Build stage
  displayName: Build stage  # Human-readable name for the stage
  jobs:
  - job: Build  # Define the Build job
    displayName: Build  # Human-readable name for the job
    pool:
      vmImage: $(vmImageName)  # Use the specified VM image for the job
    steps:
    - task: NodeTool@0  # Task to install Node.js
      inputs:
        versionSpec: '22.x'  # Specify the version of Node.js to install
      displayName: 'Install Node.js'  # Human-readable name for the step
      
    - script: |  # Start of a script block
        cd app  # Change directory to 'app'
        npm install  # Install project dependencies
      displayName: 'npm install'  # Human-readable name for the step
      
    - task: CopyFiles@2  # Task to copy files
      inputs:
        SourceFolder: '$(System.DefaultWorkingDirectory)'  # Source folder for files
        Contents: |  # Specify the contents to copy
          app/**  # Include all files in the 'app' directory
          !app/node_modules/**  # Exclude the 'node_modules' directory
        TargetFolder: '$(Build.ArtifactStagingDirectory)'  # Target folder for copied files
      displayName: 'Copy Files'  # Human-readable name for the step
      
    - task: PublishBuildArtifacts@1  # Task to publish build artifacts
      inputs:
        PathtoPublish: '$(Build.ArtifactStagingDirectory)'  # Path to the artifacts to publish
        ArtifactName: 'drop'  # Name of the artifact
        publishLocation: 'Container'  # Location to publish the artifact
      displayName: 'Publish Artifacts'  # Human-readable name for the step

- stage: Deploy  # Define the Deploy stage
  displayName: Deploy stage  # Human-readable name for the stage
  dependsOn: Build  # This stage depends on the successful completion of the Build stage
  jobs:
  - deployment: DeployToVM  # Define the deployment job
    displayName: 'Deploy to VM'  # Human-readable name for the job
    environment:
      name: $(environmentName)  # Specify the environment for deployment
      resourceType: VirtualMachine  # Specify the resource type as a Virtual Machine
    strategy:
      runOnce:  # Define the deployment strategy
        deploy:
          steps:
          - task: Bash@3  # Task to run a Bash script
            inputs:
              targetType: 'inline'  # Specify that the script is provided inline
              script: |  # Start of the script block
                # Create deployment directory if it doesn't exist
                mkdir -p /home/azureuser/app_deployment
                
                # Remove old files (if any)
                rm -rf /home/azureuser/app_deployment/*
                
                # Copy new files from the pipeline workspace to the correct directory
                cp -r $(Pipeline.Workspace)/drop/app/* /home/azureuser/app_deployment/
                
                # Install npm if not already installed
                command -v npm || { sudo apt update && sudo apt install -y npm; }
                
                # Install dependencies
                cd /home/azureuser/app_deployment  # Change to the deployment directory
                npm install  # Install project dependencies
                
                # Install PM2 globally with explicit sudo
                echo "Installing PM2 globally..."
                sudo npm install -g pm2
                
                # Stop the application if it's running
                pm2 stop app || echo "App not running in PM2"
                
                # Start the application with PM2
                cd /home/azureuser/app_deployment  # Change to the deployment directory
                echo "Starting application with PM2..."
                pm2 start app.js --name "app" || pm2 restart app
                
                # Save PM2 configuration
                echo "Saving PM2 configuration..."
                pm2 save
                
                # Set up PM2 to start on system boot
                echo "Setting up PM2 startup..."
                sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u azureuser --hp /home/azureuser
                
                echo "Deployment completed successfully!"  # Confirmation message
                echo "Application is running at http://$(hostname -I | awk '{print $1}') :3000"  # Display the application URL
```
