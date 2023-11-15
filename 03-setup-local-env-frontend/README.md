# Setup local environment for frontend app

## Task 
Clone [spring-petclinic-angular](https://github.com/spring-petclinic/spring-petclinic-angular) repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

## How To Install Angular on macOS <a name="angular_macos"></a>
[How to install Angular on macOS](https://kinsta.com/knowledgebase/install-angular/#how-to-install-angular-on-macos)

**1. Install Node.js and npm (If Not Already Installed)**

[Official Node.js website](https://nodejs.org/en)

Install `Node.js` and `npm` via `homebrew`:
```
brew install node
```

Check your current `Node` and `npm` versions:
```
$ node -v 
$ npm -v
```

**2. Install Angular CLI Globally**

Just as with the Windows instructions, you need to next install/update `Angular CLI`, which is what you need to create (and manage) Angular applications. To do this, open the Terminal and run the following commands:

```
npm uninstall -g angular-cli @angular/cli
npm cache verify
npm cache clean --force #if needed
npm install -g @angular/cli@latest 
```

<details>
  <summary>Error</summary>

```
npm ERR! code EACCES
npm ERR! syscall rename
npm ERR! path /usr/local/lib/node_modules/@angular/cli
npm ERR! dest /usr/local/lib/node_modules/@angular/.cli-G39XYeT9
npm ERR! errno -13
npm ERR! Error: EACCES: permission denied, rename '/usr/local/lib/node_modules/@angular/cli' -> '/usr/local/lib/node_modules/@angular/.cli-G39XYeT9'
npm ERR!  [Error: EACCES: permission denied, rename '/usr/local/lib/node_modules/@angular/cli' -> '/usr/local/lib/node_modules/@angular/.cli-G39XYeT9'] {
npm ERR!   errno: -13,
npm ERR!   code: 'EACCES',
npm ERR!   syscall: 'rename',
npm ERR!   path: '/usr/local/lib/node_modules/@angular/cli',
npm ERR!   dest: '/usr/local/lib/node_modules/@angular/.cli-G39XYeT9'
npm ERR! }
npm ERR! 
npm ERR! The operation was rejected by your operating system.
npm ERR! It is likely you do not have the permissions to access this file as the current user
npm ERR! 
npm ERR! If you believe this might be a permissions issue, please double-check the
npm ERR! permissions of the file and its containing directories, or try running
npm ERR! the command again as root/Administrator.
```
</details>

Solution for the error above is to set the directory owner of `/usr/local/lib/node_modules/` to  your user and after that repeat steps for installation Angular CLI Globally. Execute the following command:
```
$ sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}`
```

**3. Test Angular Installed Correctly**  
After installing the `Angular CLI`, you can utilize its commands for managing `Angular` projects. To confirm a successful installation, run the subsequent command in the Terminal:
```
ng --version
```
You should see the version of `Angular CLI` displayed.

Possible error for the command above: `You need to specify a command before moving on. Use '--help' to view the available commands.` Use following command:
```
ng version
```

## Angular frontend for Spring Petclinic

> **Warning**
> Warning: **client only**. Use REST API from backend [spring-petclinic-rest](https://github.com/spring-petclinic/spring-petclinic-rest) project. You need start backend server before start frontend application.

**Clone project from github:**

```
git clone https://github.com/spring-petclinic/spring-petclinic-angular.git
```

**Install local project package:**

```
npm install --save-dev @angular/cli@latest
if npm version > 5.0 delete package-lock.json file  (bug in npm 5.0 - this file prevent correct packages install)
npm install
```
You can see current dependencies in `package.json` file.

**Development server**

Run `ng serve` for a dev server. Navigate to http://localhost:4200/. The app will automatically reload if you change any of the source files.

![Angular](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/03-setup-local-env-frontend/screenshot_angular.png)
<p align="right">
<sub>(Web app preview)</sub>
</p>

# Build Lifecycle 🔴

Angular deployment guide is available [here](https://angular.io/guide/deployment#simple-deployment-options) with following chapters: 
- Simple deployment options
  - Building and serving from disk
  - Automatic deployment with the CLI
  - Basic deployment to a remote server
  - Deploy to GitHub Pages
- Server configuration
  - Routed apps must fall back to index.html
  - Configuring correct MIME-type for JavaScript assets
  - Requesting services from a different server (CORS)
- Production optimizations
  - Production mode at runtime
  - Lazy loading
  - Measure performance
  - Inspect the bundles
- The base tag
- The deploy url
