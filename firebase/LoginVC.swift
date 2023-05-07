//
//  LoginVC.swift
//  firebase
//
//  Created by Sohila on 01/05/2023.
//

import UIKit
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        emailTF.text = ""
        passTF.text = ""
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passTF.text, !password.isEmpty else {
            Helper.showAlert(title: "⚠️", message: "Fields can't be empty!!", from: self)
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            guard error == nil else{
                Helper.showAlert(title: "⚠️", message: "Error in Login", from: strongSelf)
                return
            }
            Helper.pushViewController(withIdentifier: "HomepageVC", from: strongSelf)
        }
    }
    
    @IBAction func goToSingUpButton(_ sender: Any) {
//        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
//        self.navigationController?.pushViewController(signUp, animated: true)
        Helper.pushViewController(withIdentifier: "SignUpVC", from: self)
    }
    
    
 
}

