//
//  Implementacao_Firebase_iOSApp.swift
//  Implementacao_Firebase_iOS
//
//  Created by Leonardo Mesquita Alves on 22/12/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        print("Firebase configured")
        return true
    }
}

@main
struct Implementacao_Firebase_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
