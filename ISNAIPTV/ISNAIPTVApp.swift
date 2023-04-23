//
//  ISNAIPTVApp.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import SwiftUI

@main
struct ISNAIPTVApp: App {
    let persistenceController = PersistenceController.shared

   
    var body: some Scene {
        WindowGroup {
//          ContentView()
//             .environment(\.managedObjectContext, persistenceController.container.viewContext)
           AppView()
        }
       
    }
  
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
