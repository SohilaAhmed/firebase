//
//  HomepageVC.swift
//  firebase
//
//  Created by Sohila on 07/05/2023.
//

import UIKit
import FirebaseAuth

class HomepageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            Helper.showAlert(title: "⚠️", message: "Error In Logout", from: self)
        }
        
    }
    
    
    
}
