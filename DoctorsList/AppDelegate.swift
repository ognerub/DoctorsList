//
//  AppDelegate.swift
//  DoctorsList
//
//  Created by Ognerub on 3/7/24.
//

import SwiftUI

final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = SceneDelegate.self
        return sceneConfiguration
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptionts: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("App Did Launch!")
        return true
    }
}
