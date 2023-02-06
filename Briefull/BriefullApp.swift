//
//  BriefullApp.swift
//  Briefull
//
//  Created by Amaal Almutairi on 11/07/1444 AH.
//

import SwiftUI
import FirebaseCore

enum Route: Hashable {
    case login
}


@main
struct BriefullApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                
                //NavigationView{
                SignUp()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .login:
                            Text("LOGIN SCREEN")
                            
                        }
                    }
            }.environmentObject(coordinator)
            //}
        }
    }
}




class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,  didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

