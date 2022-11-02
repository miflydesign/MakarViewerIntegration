//
//  AppDelegate.swift
//  NativeSwift
//
//  Created by WEN WEI LIN on 2021/2/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.all

    let MAKAR_API_KEY = "00000000-0000-0000-0000-000000000000"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupMakar()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        MakarViewerManager.shared()?.applicationWillResignActive(application)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        MakarViewerManager.shared()?.applicationDidEnterBackground(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        MakarViewerManager.shared()?.applicationWillEnterForeground(application)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        MakarViewerManager.shared()?.applicationDidBecomeActive(application)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        MakarViewerManager.shared()?.applicationWillTerminate(application)
    }

    func setupMakar(){
        MakarViewerManager.shared().initialized(withKey: MAKAR_API_KEY,
                                                window: self.window,
                                                appLaunchOpts: [:],
                                                gArgc: CommandLine.argc,
                                                gArgv: CommandLine.unsafeArgv)

    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
        
    struct AppUtility {
        
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask,
                                    andRotateTo rotateOrientation:UIInterfaceOrientation) {
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
            self.lockOrientation(orientation)
        }
        
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }

    }
    

}

