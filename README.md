# Project Setup with Cocoapods and Charts
Follow these steps to set up your project with Cocoapods and integrate the Charts library:

## Step 1: Install Cocoapods 
If you haven't installed Cocoapods yet, execute the following command in the Terminal:

```
sudo gem install cocoapods
```


## Step 2: Install Homebrew (For M-Series Chip)
If you are using an M-Series chip, you need to install Homebrew first. Execute the following command in the Terminal:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Note: Make sure you have admin privileges to run the above command.


## Step 3: Initialize Cocoapods in Your Project
Open the Terminal, navigate to your project path (cd yourprojectpath), and execute the following command:

```
pod init
```


## Step 4: Edit Podfile
Open the newly created Podfile in your project folder and add the following line under the section '# Pods for Chart':

```
pod 'Charts', '4.1.0'
```

Save the Podfile.


## Step 5: Install the Charts Library
Back in the Terminal, execute the following command to install the Charts library:

```
pod install
```


## Step 6: Open Your Project Workspace
After the installation is complete, open your project using the newly created '.xcworkspace' file.

That's it! You have successfully set up your project with Cocoapods and integrated the Charts library. Now you can start using Charts in your Xcode project. Happy coding!

