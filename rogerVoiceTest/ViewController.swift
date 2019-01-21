//
//  ViewController.swift
//  rogerVoiceTest
//
//  Created by Adadémey Marvin on 18/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var callerAddress: UITextField!
    
    @IBOutlet weak var makeCall: UIButton!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:
            #selector(receiveCall(ns:)), name: NSNotification.Name(rawValue: "incomming"), object: nil)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeCallAction(_ sender: Any) {
        let host = "sip.antisip.com"
        let cHost = (host as NSString).utf8String
        
        if let username = callerAddress.text,username.count > 0, let pwd = password.text,pwd.count > 0, let uri = addressField.text,uri.count > 0{
            
            
        let cUsername = (username as NSString).utf8String
        
        let cPwd = (pwd as NSString).utf8String
        
        let cUri = ("sip:\(uri)@sip.antisip.com" as NSString).utf8String

        PJ.shared().startPjsipAndRegister(onServer: UnsafeMutablePointer<Int8>(mutating: cHost), withUserName: UnsafeMutablePointer<Int8>(mutating: cUsername), andPassword: UnsafeMutablePointer<Int8>(mutating: cPwd))

        PJ.shared().makeCall(UnsafeMutablePointer<Int8>(mutating: cUri))
        }
        else{
            self.showAlert()

        }
    }
    
    //What to do when there is an incomming call
    @objc func receiveCall(ns: NSNotification){
        print("Received Notification")
        //INCOMMMING CALL
        DispatchQueue.main.async(execute: {

        self.performSegue(withIdentifier: "toAppel", sender: nil)
        })
    }
    
    
    //Just to receive call
    @IBAction func registerOnly(_ sender: Any) {
          if let username = callerAddress.text,username.count > 0, let pwd = password.text,pwd.count > 0{
            
            let host = "sip.antisip.com"
            
            let cHost = (host as NSString).utf8String
            let cUsername = (username as NSString).utf8String
            
            let cPwd = (pwd as NSString).utf8String
            
            
            PJ.shared().startPjsipAndRegister(onServer: UnsafeMutablePointer<Int8>(mutating: cHost), withUserName: UnsafeMutablePointer<Int8>(mutating: cUsername), andPassword: UnsafeMutablePointer<Int8>(mutating: cPwd))
            
            
        }
          else{
            
            self.showAlert()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "ERREUR", message: "Merci de verifier les champs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
   
}

