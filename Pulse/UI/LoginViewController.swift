//
//  ViewController.swift
//  Pulse
//
//  Created by Luke Klinker on 12/31/17.
//  Copyright © 2017 Luke Klinker. All rights reserved.
//

import UIKit
import Alamofire
import Async

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        password.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        login(0)
        return true
    }

    // MARK: Actions
    @IBAction func login(_ sender: Any) {
        PulseApi.conversations { (response: DataResponse<[Conversation]>) in
                debugPrint(response)

                if let conversations = response.result.value {
                conversations.forEach { print("- \($0.description)") }
                }
        }
        
//        if (email.text != nil && email.text!.count != 0 && password.text != nil && password.text!.count != 0) {
//            login.isEnabled = false
//            PulseApi.login(email: email.text!, password: password.text!) { (response: DataResponse<LoginResponse>) in
//                debugPrint(response)
//                if let loginResponse = response.result.value {
//                    let password = self.password.text!
//
//                    Async.background {
//                        print("run in background")
//                        do {
//                            try Account.createAccount(password: password, loginResponse: loginResponse)
//                            print("finished creating account")
//                        } catch {
//                            print("error encrypting")
//                        }
//                    }.main {
//                        // TODO: end the login activity
//                        print("run on main")
//                    }
//                }
//            }
//        }
    }
}
