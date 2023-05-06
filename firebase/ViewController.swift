//
//  ViewController.swift
//  firebase
//
//  Created by Sohila on 01/05/2023.
//

import UIKit
import FirebaseCore
//import Firebase
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passTF.text, !password.isEmpty else {
            print("missing field data")
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) {[weak self] result, error in
            guard error == nil else{
                self?.createAccountAlert(email: email, password: password)
                return
            }
            print("Sign in ")
        }
    }
    
    
    func createAccountAlert(email:String, password:String){
        let alert = UIAlertController(title: "Create Account", message: "Create Account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else{
                    print("account Creation Error")
                    return
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
        
    }}

