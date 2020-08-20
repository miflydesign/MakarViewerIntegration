# Makar Viewer as a Library integration example to iOS and Android #

Makar Viewer is made with Unity. The Unity Runtime Library exposes controls to manage when and how to load/activate/unload within the native application.


**Limitations**

- Makar Viewer as a Library supports rendering only full screen, rendering on a part of the screen isn’t supported.
- Loading more than one instance of the Makar Viewer runtime isn’t supported.
- You may need to adapt 3rd party Plug-ins (native or managed) to work properly  
- Overhead of having Makar Viewer in unloaded state is: 90Mb for Android and 110Mb for iOS

**How it works**

 A library part (iOS framework and Android Archive (AAR) file) that includes all source & plugins 
 A thin launcher part that includes app representation data and runs library

Step by step explanations on how to include the [iOS](docs/ios.md) / [Android](docs/android.md) library part into your native application when needed.

