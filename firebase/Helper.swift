//
//  Helper.swift
//  firebase
//
//  Created by Sohila on 07/05/2023.
//

import Foundation
import UIKit

protocol Help{
    static func showAlert(title:String, message:String, from viewController: UIViewController, completion: (() -> Void)?)
    
    static func pushViewController(withIdentifier identifier: String, from viewController: UIViewController)
}


class Helper: Help{
    static func showAlert(title:String, message:String, from viewController: UIViewController, completion: (() -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default){ _ in
            completion?()
        })
        viewController.present(alert, animated: true)
    }
    
    static func pushViewController(withIdentifier identifier: String, from viewController: UIViewController) {
        let nextViewController = viewController.storyboard?.instantiateViewController(withIdentifier: identifier)
        viewController.navigationController?.pushViewController(nextViewController!, animated: true)
    }
    
    
}
