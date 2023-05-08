//
//  AppDelegate.swift
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
//import GoogleSignIn
//import GoogleSignInSwift
//import GoogleUtilities
//import GoogleDataTransport
// ...
      
@main
class AppDelegate: UIResponder, UIApplicationDelegate{
//, GIDSignInDelegate {
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        print("User Email: \(user.profile.email ?? "No Email")")
//    }
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
//        GIDSignIn.sharedInstance()?.clientID = "114549090278-ue0l1d0bn8vv42esco7nvkoktona5v8o.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance()?.delegate = self
        
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

