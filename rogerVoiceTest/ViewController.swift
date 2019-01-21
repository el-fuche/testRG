//
//  ViewController.swift
//  rogerVoiceTest
//
//  Created by Adadémey Marvin on 18/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var makeCall: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    [[PJ sharedPJ] startPjsipAndRegisterOnServer:"[host UTF8String]" withUserName:"[username UTF8String]" andPassword:"[pass UTF8String]"];
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeCallAction(_ sender: Any) {
        let host = "sip.antisip.com"
        let cHost = (host as NSString).utf8String
        
        let username = "marvin2"
        let cUsername = (username as NSString).utf8String
        
        let pwd = "password"
        let cPwd = (pwd as NSString).utf8String
        
        let uri = "sip:test.ring@sip5060.net"
        let cUri = (uri as NSString).utf8String
        
        
//        PJ.shared().startPjsipAndRegister(onServer: UnsafeMutablePointer<Int8>(mutating: cHost), withUserName:  UnsafeMutablePointer<Int8>(mutating: cUsername), andPassword:UnsafeMutablePointer<Int8>(mutating: cPwd)) {
//
//        }
        PJ.shared().startPjsipAndRegister(onServer: UnsafeMutablePointer<Int8>(mutating: cHost), withUserName: UnsafeMutablePointer<Int8>(mutating: cUsername), andPassword: UnsafeMutablePointer<Int8>(mutating: cPwd))

        PJ.shared().makeCall(UnsafeMutablePointer<Int8>(mutating: cUri))
    }
    
 
   
}

