## Integrating Unity as a library into standard Android app

This document explains how to include Unity as a Library into standard Android application through Activity. You can read more about [Unity as a Library](https://docs.unity3d.com/2019.3/Documentation/Manual/UnityasaLibrary.html).

Pre-requisites
--------------
- Sign up and get API key from [Makar development](https://developer.makar.app). 

Requirements
--------------
- Android Studio 3.4.2+
- Unity version 2019.3.0b4+

Getting Started
--------------
**1. Get source**
- Download Makar Viewer Project [MakarViewer](https://makar.app/makarview_embed.zip). 
- Clone or Download GitHub repo [MakarViewerIntegration](https://github.com/vml933/MakarViewerIntegration.git).
- Create new foler named "Example", extract MakarViewer.zip in it and move NativeAndroidApp Folder at same level.
  <br><img src="images/android/folderStructure.png">
  - NativeAndroidApp - this is simple Android application where we want to integrate our makar viewer project. It has some UI and is prepared to load viewer.
    - MakarViewer - this is a makar viewer project made with Unity which will be integrated to the standard Android application.

**2. Add Unity Library module to NativeAndroidApp**
<br>Do the following to add the exported MakarViewer module to the NativeAndroidApp Gradle project in Android Studio:
- Open NativeAndroidApp in Android Studio
- Open settings.gradle file
  - Add a new project pointing to MakarViewer module at the end of the file: 
  ```
  include ':MakarViewer'
  project(':MakarViewer').projectDir=new File('..\\MakarViewer')
  ```
  <img src="images/android/settingsGradle.png">
- Open build.gradle(Module: app) file
  - Add the following in dependencies{ block
  ```
  implementation project(':MakarViewer')
  implementation fileTree(dir: project(':MakarViewer').getProjectDir().toString() + ('\\libs'), include: ['*.jar'])
  ```
  <img src="images/android/buildGradleApp.png">
- Open build.gradle(Project: NativeAndroidApp) file
  - Add the following in allprojects{repositories{ block
  ```
  flatDir {
    dirs "${project(':MakarViewer').projectDir}/libs"
  }
  ```
  <img src="images/android/buildGradleNativeApp.png">
- Click Sync Now to do a project sync since Gradle files have been modified
  <img src="images/android/syncGradle.png">
- If everything succeeds, you should see MakarViewer module added in Android view
  <img src="images/android/unityLibraryModule.png">

Set AndroidManifest
--------------
- Add PermissionActivity、UnityARPlayerActivity Activity
<img src="images/android/setManifestActivity.png">

Script
--------------

- Start PermissionActivity check MAKAR need Permission.
```
Intent intent = new Intent();
        intent.setClass(this,org.mifly.makar.unity.PermissionActivity.class);
        intent.putExtra("makarApiKey","");
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK |Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(intent);
```

- Set back activity add CLASS_NAME_ANTHOR_PROJECT_NATIVE value
```
intent.putExtra("CLASS_NAME_ANTHOR_PROJECT_NATIVE","");
```

- load project nedd add projectId、projectType value
```
intent.putExtra("projectId","");
intent.putExtra("projectType","");
```
- display user page nedd add userId value
```
intent.putExtra("userId","");
```

## Workspace is ready

Everything is ready to build, run and debug:
<br><img src="images/android/selectTargetToBuild.png">

If all went successfully at this point you should be able to run NativeAndroidApp.

References
-------
- [Unity Documentation](https://docs.unity3d.com/Manual/UnityasaLibrary-iOS.html)
- [Integrating Unity as a library into standard Android app](https://github.com/Unity-Technologies/uaal-example)

License
-------
Copyright © MIND & IDEA FLY CO., LTD

Contact
-------
<infomarkar@miflydesign.com>
