//
//  AppView.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import SwiftUI

struct AppView: View {
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        Group{
            switch navigationManager.navigationSection{
            case .launchScreen:
                LaunchscreenView()
            case .profilLoading:
                ProfilLoadingView()
                    .environmentObject(navigationManager)
            case .mainView:
                MainView()
                    .environmentObject(navigationManager)
                    .environmentObject(XtreamManager.sharedInstance)
            default:
                EmptyView()
            }
        
        }
        .onAppear {
            if let xtreamSession = XtreamManager.sharedInstance.xtreamSession {
                navigationManager.navigationSection = .profilLoading
            } else {
                navigationManager.navigationSection = .loginView
            }
        }
        
    }
}

