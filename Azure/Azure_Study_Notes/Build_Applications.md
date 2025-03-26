# Build Applications with Azure DevOps - .NET App 

## LO : 

- Collaborate with others to build your applications using Azure Pipelines and GitHub
- Run automated tests in your pipeline to validate code quality
- Scan your source code and third-party components for potential vulnerabilities
- Define multiple pipelines that work together to build your application
- Build applications using both Microsoft-hosted agents and your own build agents

# Pre requisites 

- Azure DevOps organization with access to parallel jobs 
- Azure subscription 
- GitHub
- VSC 
- .NET 6.0 SDK
- Git 

# How to get .NET 

- Download the .NET SDK package using this link : [.NET WinGet Config File](https://dotnet.microsoft.com/download/dotnet/scripts/dotnet_configuration.winget)

## What is .NET 

.NET is a free, open source and cross platform development platform, you can help build applications. 

#### what can you build 

![scenario ci](/Images/net.JPG)

#### .NET(V.5+) vs .NET Framework(V.<=4.8.1>)
 
| Feature                     | .NET Framework                          | .NET (Core)                             |
|-----------------------------|----------------------------------------|-----------------------------------------|
| **Platform**                | Windows only                           | Cross-platform (Windows, macOS, Linux) |
| **Performance**             | Generally slower due to Windows-only optimizations | Improved performance and scalability    |
| **Deployment**              | Requires installation on the target machine | Self-contained deployment possible      |
| **APIs**                    | Rich set of APIs, but limited to Windows | Modular APIs, can include only what you need |
| **Development Model**       | Monolithic                             | Microservices-friendly                   |
| **Open Source**             | Not open source                        | Fully open source                       |
| **Support for Modern Features** | Limited support for modern features | Supports modern development practices, including async programming |
| **Use Cases**               | Enterprise applications, desktop apps  | Web applications, cloud services, microservices, cross-platform apps |

#### Summary

- **.NET Framework** is best suited for Windows-based applications, especially for legacy systems and enterprise applications that require a rich set of APIs and Windows-specific features.
- **.NET (Core)** is the better choice for new projects, especially if you need cross-platform support, improved performance, and modern development practices. It is more flexible and suitable for cloud-based applications and microservices.

In conclusion, if you're starting a new project, **.NET (Core)** is generally the preferred option due to its versatility and performance benefits.

#### Check if you downloaded the package correctly 

- once downloaded if you go to your terminal and run `dotnet` you should see :

```
usage: dotnet [options]
usage: dotnet [path-to-application]

... 

```

#### Lets make our first app with .NET

- In vs code use the shortcut :    ctrl + shift + p 
- type :

```
>.NET: new project 

pick console app # you will need a name for the app and the dir for the app to be saved 

```

Within the folder you should see a .cs file, you can simply run this :)  


# Task - Help your team set up a continuous integration pipeline for their app  

- we want to run the pipeline on a microsoft-hosted agent, we need to make sure we have at least one microsoft-hosted parallel job. 
- This will allow multiple tasks like building and testing to occur at the same time. 

![scenario ci](/Images/ci.png)

## What is Azure pipelines ? 

Azure pipelines is a cloud service you can use to automatically build, test, and deploy your code project. 

#### What is CI pipeline ? 

CI is the process of automating the building and testing of code every time a team member commits changes to version control. 


![scenario ci](/Images/ci2.png)

`Tasks` - Its like a script that defines how your build, test and deployment steps are run. 

`Code` - The pipeline runs when you submit code changes 

`Build agent` - builds or deploys the code 

`artifact` - The final product of the pipeline is a build artifact 


## Get the sample file 

- we can fork a repo which holds the app that we are working with 

- clone repo to our working space 

```Bash
git clone https://github.com/chandiaaron/mslearn-tailspin-spacegame-web.git
```

- Check the remote repo which is linked to my local copy : 

```Bash

git remote -v  # I have one remote called origin which points to my github repo 

```

- adding upstream remote, to track the original repo which allows for fetch updates 

```Bash

git remote add upstream https://github.com/MicrosoftDocs/mslearn-tailspin-spacegame-web.git 

```

if the original owner made updates to his repo we can use and then merge them into our main brach  

```Bash 

git fetch upstream 
git merge upstream/main 

```

If you want to open the current dir in your IDE quickly without cluttering your space you can this command 


```Bash 

code -r . 


```

# lets run our web app 

```Bash

dotnet build --configuration Release 

```

Complies the application in release mode, optimizing it for performance and preparing it for deployment. This is typically the final step before deploying it to a production environment. 

```Bash

dotnet run --configuration Release --no-build --project Tailspin.SpaceGame.Web

```

the command is used to quickly run your .NET application in Release mode without rebuilding it, using the existing binaries from the specified project. This is particularly useful for testing or running the application after making changes to the code without needing to rebuild every time.


# Plan your build tasks 

- when building azure pipelines you need to think about existing build scripts. You can find out by talking to the lead dev on your team, in this example we are working with : 


    - The build machine is running Ubuntu 22.04
    - The build machine includes build tools like: 
        - npm, the package manager for Node.js 
        - NuGet, the package manager for .NET
        - .NET SDK 
    - The project uses syntactically Awesome Style Sheets (Sass) to make it easier to author cascading style sheets (CSS) files. 
    - The project uses the gulp toolkit to minify JavaScript and CSS files. 


#### Script 

```Bash 

#!/bin/bash

# Install Node.js modules as defined in package.json.
npm install --quiet

# Compile Sass (.scss) files to standard CSS (.css).
node-sass Tailspin.SpaceGame.Web/wwwroot

# Minify JavaScript and CSS files.
gulp

# Print the date to wwwroot/buildinfo.txt.
echo `date` > Tailspin.SpaceGame.Web/wwwroot/buildinfo.txt

# Install the latest .NET packages the app depends on.
dotnet restore

# Build the app under the Debug configuration.
dotnet build --configuration Debug

# Publish the build to the /tmp directory.
dotnet publish --no-build --configuration Debug --output /tmp/Debug

# Build the app under the Release configuration.
dotnet build --configuration Release

# Publish the build to the /tmp directory.
dotnet publish --no-build --configuration Release --output /tmp/Release

```

#### Example of a pipeline task : 

```YAML

task: DotNetCoreCLI@2
  displayName: 'Build the project'
  inputs:
    command: 'build'
    arguments: '--no-restore --configuration Release'
    projects: '**/*.csproj'

```

- The above pipeline translate to this command 

```Bash

dotnet build MyProject.csproj --no-restore --configuration Release

```

### Breaking Down the Task: DotNetCoreCLI@2

The `DotNetCoreCLI@2` task in Azure Pipelines is used to run .NET CLI commands. Here's a detailed breakdown of its components:

---

#### **Task Mapping**
- The `DotNetCoreCLI@2` task maps directly to the `dotnet` command-line interface (CLI).

---

#### **Key Components**

1. **`displayName`**
   - Defines the name of the task as it appears in the Azure Pipelines user interface.
   - Example: `'Build the project'`.

2. **`inputs`**
   - Specifies the arguments and options passed to the `dotnet` command.

3. **`command`**
   - Specifies the specific `dotnet` subcommand to run.
   - In this case, it runs the `dotnet build` subcommand.

4. **`arguments`**
   - Specifies additional arguments to pass to the `dotnet` command.
   - Example: `'--no-restore --configuration Release'`:
     - `--no-restore`: Skips restoring dependencies (assumes they are already restored).
     - `--configuration Release`: Builds the project in Release mode, optimizing it for production.

5. **`projects`**
   - Specifies which projects to build.
   - Example: `'**/*.csproj'`:
     - **`**`**: Searches the current directory and all child directories.
     - **`*.csproj`**: Matches any `.csproj` file (project files for .NET applications).
   - This wildcard pattern allows you to act on multiple files without specifying each one. If you need to target a specific file, you can replace the wildcard with the file's path.

6. **`@` in the Task Name**
   - The `@2` in `DotNetCoreCLI@2` refers to the task's version.
   - As new versions of the task become available, you can migrate to the latest version to take advantage of new features and improvements.


# Building our Pipeline 

- create a new project within your organization 

```

"""
if you need to change project visibility to public or private  : 

- go to your organization settings and click policies and toggle allow public projects 
- go to your specific project and go to settings, in overview you can now see an option to toggle visibility from private to public 

"""


```

- Go to the pipeline tab and click create new 
- we want to connect our GitHub and click the repo we forked 
- configure for ASP.NET Core 
- review the yaml file and run 


