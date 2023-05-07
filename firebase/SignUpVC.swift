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
            print("missing field data")
            return
        }
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard error == nil else{
                self?.showAlert(title: "Account Creation Error", message: "Account Creation Error")
                return
            }
        }
    }
    
    @IBAction func goToLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
        
    }
    
}


