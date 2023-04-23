//
//  ProfilLoadingView.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import SwiftUI

struct ProfilLoadingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var profilLoadingViewModel = ProfilLoadingViewModel()
    
    var body: some View {
        VStack{
            HStack(spacing: 20){
                Text(profilLoadingViewModel.moviesLoaded ? "Movies: Loaded" : "Movies: Loading")
                Text(profilLoadingViewModel.moviesLoaded ? "Series: Loaded" : "Series: Loading")
                Text(profilLoadingViewModel.moviesLoaded ? "Live TV: Loaded" : "Live TV: Loading")
            }
        }
        .onChange(of: profilLoadingViewModel.displayMainView) { displayMainView in
            navigationManager.navigationSection = .mainView
        }
    }
}
