//
//  AppView.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import SwiftUI

struct AppView: View {
    @StateObject var navigationManager = NavigationManager()
    let xtreamRepository = XtreamRepository.sharedInstance
    
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
                    .environmentObject(XtreamManager.sharedInstance.xtreamSession)
            default:
                EmptyView()
            }
        
        }
        .onAppear {
            guard let _ = xtreamRepository.getCurrentProfil() else{
                navigationManager.navigationSection = .loginView
                return
            }
            navigationManager.navigationSection = .profilLoading 
        }
        
    }
}

