//
//  SignUpVC.swift
//  firebase
//
//  Created by Sohila on 07/05/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signUPButton(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            Helper.showAlert(title: "⚠️", message: "Fields can't be empty!!", from: self)
            return
        }
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let strongSelf = self else { return }
            guard error == nil else{
                Helper.showAlert(title: "⚠️", message: "Account Creation Error", from: strongSelf)
                return
            }
            Helper.pushViewController(withIdentifier: "LoginVC", from: strongSelf)
        }
    }
    
    @IBAction func goToLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
    
}


