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
        let projectId = "2e011aec1f0be6547f9069bfe05816ee"
        
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .AR)        
    }

    @IBAction
    func btnEnterARSlam(){
        let projectId = "ca6e231b9bde8183dc8f208ab619055a"
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .AR_SLAM)
    }
    
    @IBAction
    func btnEnterVR(){
        let projectId = "a1d05d718e2ba6991806e0698ceaab34"
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .VR)
    }
    
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

