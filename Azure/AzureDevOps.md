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

## how to export repo locally 

- select the repo you want to clone : 

![importing a repo from Github](/Images/az12.JPG)


## How to revert any commits 

- if we go to the commit node we can see all of the histroy 

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

YAML - is a human-readable data serialisation standard, often used to write configuration files 

`serialisation` - translates data structures or object state into a format that can be stored and reconstructed later in a different computer environment, `config as code `. 


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


