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
        let projectId = "52703099ec9adea8e12a8016b16b75e5"
        MakarViewerManager.shared()?.showProject(withProjectId: projectId, type: .VR)
    }
    
    @IBAction
    func btnOpenUserTap(){
        let userAccount = "Makarvr"
        MakarViewerManager.shared()?.showUser(with: userAccount)
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
    
    func makarRequestUserInfoPage(_ userId: String!) {
        //TODO
    }

}

