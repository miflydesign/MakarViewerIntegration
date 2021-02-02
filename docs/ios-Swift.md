## Integrating Makar Viewer as a library into standard iOS app

This document explains how to include Makar Viewer as a Library into standard iOS application.

Pre-requisites
--------------
- (Option) Get Pro API key: If you want to remove watermark, Contact <infomakar@miflydesign.com>

Requirements
--------------
- Xcode 11.0+

Getting Started
--------------
**1. Get source**
- Download Makar Viewer Framework and files. [Download](https://makar-viewer-embed.s3-ap-northeast-1.amazonaws.com/MakarViewer_3_2_2_ios_1611729044.zip) 
- Clone or Download GitHub repo. [MakarViewerIntegration](https://github.com/vml933/MakarViewerIntegration.git)
- Download and Print AR Marker Image. [Sample Marker Image](https://makar-viewer-embed.s3-ap-northeast-1.amazonaws.com/ARSamplePoster.png)

**2. Add UnityFramework.framework**
With this step we add Makar Viewer in the form of a framework to NativeSwift.
- Put UnityFramework.framework and files we just download in your project.
- Xcode auto create Bridging Header file.
<br><img src="images/ios-swift/createBridgingHeader.png">
- select NativeSwift target from NativeSwift project
- in "General" tab / "Frameworks, Libraries, and Embedded Content"
- Set "UnityFramework.framework" Embed value is "Embed & Sign"
  <br><img src="images/ios-swift/addToEmbeddedContent.png">
- in "Build Settings" tab, set "Enable Bitcode" to "No"
- in "Build Phases" tab, expand "Link Binary With Libraries"
- remove UnityFramework.framework from the list (select it and press - )
  <br><img src="images/ios-swift/removeLink.png">

**4. Setup Privacy**
- Add the following service setup to `info.plist` file
```
Privacy - Camera Usage Description
Privacy - Photo Library Additions Usage Description
Privacy - Photo Library Usage Description
Privacy - Location Always and When In Use Usage Description
Privacy - Location When In Use Usage Description
Privacy - Location Always Usage Description
```

Script
--------------
- Set valid `makarApiKey` value in AppDelegate.swift
- Initialize MakarViewer in `application didFinishLaunchingWithOptions`
```
MakarViewerManager.shared().initialized(withKey: MAKAR_API_KEY,
                                        window: self.window,
                                        appLaunchOpts: [:],
                                        gArgc: CommandLine.argc,
                                        gArgv: CommandLine.unsafeArgv)
```
- Implement `MakarViewerDelegate` to receive MakarViewer status
```
func makarDidLoad() 
func makarDidUnload()
func makarDidQuit()
func makarRequestUserInfoPage()-> String
```
- Active MakarViewer and load project
```
MakarViewerManager.shared()?.showProject(withProjectId: PROJECT_ID, type: .AR)
```
- Active MakarViewer and display user page
```
MakarViewerManager.shared()?.showUser(with: USER_ACCOUNT)
```
- Unload MakarViewe will release most of the memory it occupies, but not all of it. You will be able to run MakarViewer again.
```
MakarViewerManager.shared()?.unload()
```

- Quit MakarViewer completely will release all memory.<br>
Note: You won’t be able to run MakarViewer again in the same process after this call. You can set quitHandler on AppController to override the default process kill.
```
MakarViewerManager.shared()?.didQuit
```
Learn more in `AppDelegate.swift` and `ViewController.swift`

References
-------
- [Unity Documentation](https://docs.unity3d.com/Manual/UnityasaLibrary-iOS.html)
- [Integrating Unity as a library into standard iOS app](https://github.com/Unity-Technologies/uaal-example)

License
-------
Copyright © MIND & IDEA FLY CO., LTD

Contact
-------
<infomakar@miflydesign.com>