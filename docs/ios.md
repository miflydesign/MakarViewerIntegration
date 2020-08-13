## Integrating Makar Viewer as a library into standard iOS app

This document explains how to include Makar Viewer as a Library into standard iOS application. You can read more about [Unity as a Library](https://docs.unity3d.com/2019.3/Documentation/Manual/UnityasaLibrary.html).

Pre-requisites
--------------
- Sign up and get API key from [Makar development](https://developer.makar.app). 

Requirements
--------------
- Xcode 11.0+

Getting Started
--------------
**1. Get source**
- Download Makar Viewer Project [MakarViewer](https://github.com/Unity-Technologies/uaal-example). 
- Clone or Download GitHub repo [MakarViewerIntegration](https://github.com/vml933/MakarViewerIntegration.git).
- Create new foler named "Example", extract MakarViewer.zip in it and move NativeObjc Folder at same level.
	<br><img src="images/ios/folderStructure.png">
	- NativeObjc - this is simple Xcode single view application where we want to integrate our makar viewer project. It has some UI and is prepared to load viewer.
    - MakarViewer - this is a makar viewer project made with Unity which will be integrated to the standard iOS application.

**2. Setup Xcode workspace**
Xcode workspace allows to work on multiple projects simultaneously and combine their products
- open NativeObjc.xcodeproj from Xcode
- create workspace and save it at Example/both.xcworkspace. (File / New / Workspace)
  <br><img src="images/ios/workspaceLocation.png">
- close NativeObjc.xcodeproj project all Next steps are done from just created Workspace project
- add NativeObjc.xcodeproj and Unity-iPhone.xcodeproj in MakarViewer folder to workspace on a same level ( File / Add Files to “both” )
  <br><img src="images/ios/workspaceProjects.png">

**3. Add UnityFramework.framework**
With this step we add Makar Viewer in the form of a framework to NativeObjc.
- select NativeObjc target from NativeObjc project
- in "General" tab / "Frameworks, Libraries, and Embedded  Content" press +
- Add Unity-iPhone/UnityFramework.framework
  <br><img src="images/ios/addToEmbeddedContent.png">
- in "Build Phases" tab, expand "Link Binary With Libraries"
- remove UnityFramework.framework from the list (select it and press - )
  <br><img src="images/ios/removeLink.png">

**4. Setup Privacy**
- Add the following service setup to `info.plist` file
```
Privacy - Location Always and When In Use Usage Description
Privacy - Location When In Use Usage Description
Privacy - Location Always Usage Description
Privacy - Camera Usage Description
Privacy - Photo Library Additions Usage Description
Privacy - Photo Library Usage Description
```

**5. Script**
- Add `#import "AppDelegate.h"` into your ViewController.m.
- Add `@property (strong, nonatomic) AppDelegate *delegate;"` into your ViewController.m.
- Call `[self.delegate initMakar]` to initialize MakarViewer and show.
- Call `[self.delegate unloadMakar]` to unload MakarViewer and receive a callback to UnityFrameworkListener after the unload completes. MakarViewer will release most of the memory it occupies, but not all of it. You will be able to run MakarViewer again.

## Workspace is ready
Everything is ready to build, run and debug for both projects: Unity-iPhone and NativeObjc (select NativeObjc scheme to run Native App with integrated Unity or Unity-iPhone to run just Unity App part)
<br><img src="images/ios/selectTargetToBuild.png">
If all went successfully at this point you should be able to run NativeObjc.

License
-------
Copyright © MIND & IDEA FLY CO., LTD

Contact
-------
<infomarkar@miflydesign.com>