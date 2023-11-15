# Setup local environment for backend app

## Task 

Clone [spring-petclinic-rest](https://github.com/spring-petclinic/spring-petclinic-rest) repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

## Java 

Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself. It is a fast, secure, reliable programming language for coding everything from mobile apps and enterprise software to big data applications and server-side technologies.

Because Java is a free-to-use and a versatile language, it builds localized and distributed software. Some common uses of Java include:
1. Game Development
2. Cloud computing
3. Big Data
4. Artificial Intelligence
5. Internet of Things

Java is popular because it has been designed for ease of use. Some reasons developers continue to choose Java over other programming languages include:
- High quality learning resources
- Inbuilt functions and libraries
- Active community support
- High-quality development tools
- Platform Independent
- Security

## Maven 

No matter how small or large, all applications must undergo a specific series of processes, such as generating and compiling source code. Developers can manually configure these processes, but it’s a time-consuming burden. To solve this issue, we can use Apache Maven, which automates the entire process and makes Java developers’ daily work easier.

Maven is a software project management and comprehension tool. Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.

Maven's primary goal is to allow a developer to comprehend the complete state of a development effort in the shortest period of time. In order to attain this goal, Maven deals with several areas of concern:
- Making the build process easy
- Providing a uniform build system
- Providing quality project information
- Encouraging better development practices
- Documentation
- Dependencies
- Reports 
- SCMs
- Distribution
- Releases
- Mailing list


## Maven wrapper 

Maven Wrapper is an easy way to ensure a user of your Maven build has everything necessary to run your Maven build, including correct version of Maven.

Maven to date has been very stable for users, is available on most systems or is easy to procure: but with many of the recent changes in Maven it will be easier for users to have a fully encapsulated build setup provided by the project. With the Maven Wrapper, this is very easy to do and it's a great idea and initial implementation borrowed from Gradle.

The Maven Wrapper includes a shell script (mvnw for Unix-like systems and mvnw.cmd for Windows) and a small JAR file. When you execute the mvnw script, it checks if the required version of Maven is available locally. If it's not, it downloads the specified version of Maven and uses it to build the project. This ensures consistency in the build process across different environments and avoids issues related to version discrepancies.

## Spring framework

The Spring Framework provides a comprehensive programming and configuration model for modern Java-based enterprise applications - on any kind of deployment platform. It is an application framework and inversion of control container for the Java platform. 

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

It is not the same as Spring Boot, as Spring Boot is built on top of the conventional Spring framework. Spring Boot is often used when you want to quickly set up a Spring-based project with minimal configuration, making it easier to get started with Spring-based development.

## Swagger

Swagger is a set of open-source tools built around the OpenAPI Specification that can help you design, build, document and use REST APIs.

## Install Java on Mac OS
[Tutorial link](https://www.digitalocean.com/community/tutorials/install-maven-mac-os)

**1. Downloading Java for Mac OS** 

Go to the latest JDK GA release page (https://jdk.java.net/) and download the tar file for Mac OS. Then extract it to the directory of your choice. I prefer to keep my JDK setup at `/Library/Java/JavaVirtualMachines/` directory.

`$ tar -xvf openjdk-21_macos-x64_bin.tar.gz`
`$ sudo mv jdk-21.jdk/ /Library/Java/JavaVirtualMachines/`

**2. Setting Environment Variables - JAVA_HOME and Path**

Open `~/.bash_profile` and add the following entries at the end of it.
```
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
PATH="${JAVA_HOME}/bin:${PATH}"
export PATH
```
You can relaunch the Terminal to apply these profile changes. Or you can also run `source .bash_profile` command to apply these environment variable changes. 

**3. Verifying the JDK installation**

Open the Terminal and run `java -version` command. It should show the following output.
```
$ java -version
openjdk version "21" 2023-09-19
OpenJDK Runtime Environment (build 21+35-2513)
OpenJDK 64-Bit Server VM (build 21+35-2513, mixed mode, sharing)
$
```

## Install Maven on MacOS

**Our project includes the Maven Wrapper, so it is not required to separately download and install Maven.**

<details>
  <summary></summary>

**1. Download Maven for Mac OS** 

Go to the [Maven Download site](https://maven.apache.org/download.cgi) and download the `Binary tar.gz archive` file. After downloading, extract it using following command:
```
$ tar -xvf apache-maven-3.9.5-bin.tar.gz
```

**2. Setting Maven Environment Variables - M2_HOME and Path**

The next step is to set up the environment variables - `M2_HOME` and `Path`. We have to add the Maven bin directory to the Path variable. Open `.bash_profile` in your favorite text editor and add below lines to the end of it.
```
export M2_HOME="/Users/adinpilavdzija/Downloads/apache-maven-3.9.5"
PATH="${M2_HOME}/bin:${PATH}"
export PATH
```
You can relaunch Terminal to load these profile settings or use `source .bash_profile` command to apply it.

**3. Verifying the Maven Installation**

Finally, run the `mvn -version` command to check if Maven is installed successfully.
```
$ mvn -version
Apache Maven 3.9.5 (57804ffe001d7215b5e7bcb531cf83df38f93546)
Maven home: /Users/adinpilavdzija/Downloads/apache-maven-3.9.5
Java version: 21, vendor: Oracle Corporation, runtime: /Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home
Default locale: en_GB, platform encoding: UTF-8
OS name: "mac os x", version: "13.3", arch: "x86_64", family: "mac"
$
```
The output shows maven home location, the JDK it’s using and also the Mac OS version details. Maven is successfully installed on your Mac OS. You are ready to create a maven based Java projects.

</details>

## Running petclinic locally with maven command line

```
git clone https://github.com/spring-petclinic/spring-petclinic-rest.git
cd spring-petclinic-rest
./mvnw spring-boot:run
```
You can then access petclinic here: http://localhost:9966/petclinic/.

![Swagger screenshot](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/02-setup-local-env-backend/screenshot_java_maven.png)
<p align="right">
<sub>(Swagger preview)</sub>
</p>

# Build Lifecycle 🔴

## Build Lifecycle Basics
Maven is based around the central concept of a build lifecycle. What this means is that the process for building and distributing a particular artifact (project) is clearly defined.

For the person building a project, this means that it is only necessary to learn a small set of commands to build any Maven project, and the [POM](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html) will ensure they get the results they desired.

There are three built-in build lifecycles: default, clean and site. The `default` lifecycle handles your project deployment, the `clean` lifecycle handles project cleaning, while the `site` lifecycle handles the creation of your project's web site.


## A Build Lifecycle is Made Up of Phases
Each of these build lifecycles is defined by a different list of build phases, wherein a build phase represents a stage in the lifecycle.

For example, the default lifecycle comprises of the following phases (for a complete list of the lifecycle phases, refer to the Lifecycle Reference):

- `validate` - validate the project is correct and all necessary information is available
- `compile` - compile the source code of the project
- `test` - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
- `package` - take the compiled code and package it in its distributable format, such as a JAR.
- `verify` - run any checks on results of integration tests to ensure quality criteria are met
- `install` - install the package into the local repository, for use as a dependency in other projects locally
- `deploy` - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects.

These lifecycle phases (plus the other lifecycle phases not shown here) are executed sequentially to complete the `default` lifecycle. Given the lifecycle phases above, this means that when the default lifecycle is used, Maven will first validate the project, then will try to compile the sources, run those against the tests, package the binaries (e.g. jar), run integration tests against that package, verify the integration tests, install the verified package to the local repository, then deploy the installed package to a remote repository.

## Usual Command Line Calls
You should select the phase that matches your outcome. If you want your jar, run `package`. If you want to run the unit tests, run `test`.

If you are uncertain what you want, the preferred phase to call is `mvn verify`. This command executes each default lifecycle phase in order (`validate`, `compile`, `package`, etc.), before executing `verify`. You only need to call the last build phase to be executed, in this case, `verify`. In most cases the effect is the same as `package`. However, in case there are integration-tests, these will be executed as well. And during the `verify` phase some additional checks can be done, e.g. if your code written according to the predefined checkstyle rules.

In a build environment, use the following call to cleanly build and deploy artifacts into the shared repository:
```
mvn clean deploy
```

The same command can be used in a multi-module scenario (i.e. a project with one or more subprojects). Maven traverses into every subproject and executes clean, then executes deploy (including all of the prior build phase steps).

---

**The full guide "Introduction to the Build Lifecycle" can be found on [this link](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html).**
