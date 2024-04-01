//
//  ViewController.swift
//  NativeSwift
//
//  Created by WEN WEI LIN on 2021/2/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MakarViewerManager.shared()?.delegate = self
    }
    
    @IBAction
    func btnEnterAR(){
        let projectId = "c2ca3fda-83fb-4a74-83ea-41bbe084e0a9"
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .AR)
    }

    @IBAction
    func btnEnterARSlam(){
        let projectId = "830f8ae9117aa2bc30097ba16936bbe9"
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .AR_SLAM)
    }
    
    @IBAction
    func btnEnterVR(){
        let projectId = "f6574a6c-4595-4124-8c9f-a9605a8b5d8c"
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .VR)
    }
    
    /*
    @IBAction
    func btnEnterHand(){
        MakarViewerManager.shared()?.showProject(withProjectId: PROJECT_ID, type: .HAND)
    }

    @IBAction
    func btnEnterMix(){
        MakarViewerManager.shared()?.showProject(withProjectId: PROJECT_ID, type: .MIX)
    }
     */

    func setOrientation(_ orientation: UIInterfaceOrientationMask){
        AppDelegate.AppUtility.lockOrientation(orientation, andRotateTo: UIInterfaceOrientation.portrait)
    }

}

extension ViewController: MakarViewerDelegate{
    
    func makarDidLoad() {
        //TODO
    }
    
    func makarDidUnload() {
        //TODO
    }
    
    func makarDidQuit() {
        //TODO
    }
        
    func makarRequestOrientation(_ orientation: String!) {
        //Makar project require device orientation
        let targetOrientation = orientation == "portrait" ? UIInterfaceOrientationMask.portrait: UIInterfaceOrientationMask.landscape
        setOrientation(targetOrientation)
    }


}

