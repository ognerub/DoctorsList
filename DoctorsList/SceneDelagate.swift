//
//  SceneDelagate.swift
//  DoctorsList
//
//  Created by Ognerub on 3/7/24.
//

import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        print("SceneDelegate connected")
        let window = UIWindow(windowScene: windowScene)
        
        let contentView = DoctorsView()
        
        window.rootViewController = UIHostingController(rootView: contentView)
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
