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

import GoogleSignIn


class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet var googleSignin: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        googleSignin.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
    }
    
//    @objc private func googleLogin(){
//
//    }
    
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
    
    
    
    
    @IBAction func loginWithGoogle(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                return
                // ...
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
                // ...
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                // At this point, our user is signed in
            }
        }
    }
    
    

    
    
    
    
    @IBAction func goToSingUpButton(_ sender: Any) {
        //        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        //        self.navigationController?.pushViewController(signUp, animated: true)
        Helper.pushViewController(withIdentifier: "SignUpVC", from: self)
    }
    
    
    
}

