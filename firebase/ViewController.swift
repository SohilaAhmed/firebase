//
//  ViewController.swift
//  firebase
//
//  Created by Sohila on 01/05/2023.
//

import UIKit
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passTF.text, !password.isEmpty else {
            showAlert(title: "missing field data", message: "missing field data")
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) {[weak self] result, error in
            guard error == nil else{
                self?.showAlert(title: "Error in Login", message: "Error in Login")
                return
            }
            print("Login Successfully")
        }
    }
    
    @IBAction func goToSingUpButton(_ sender: Any) {
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
        
    }
}

