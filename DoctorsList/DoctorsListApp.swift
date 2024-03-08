//
//  DoctorsListApp.swift
//  DoctorsList
//
//  Created by Ognerub on 3/6/24.
//

import SwiftUI

@main
struct DoctorsListApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            DoctorsView()
        }
    }
}
