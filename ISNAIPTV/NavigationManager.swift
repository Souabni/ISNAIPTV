//
//  NavigationManager.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import Foundation

class NavigationManager : ObservableObject{
    @Published var navigationSection : NavigationSection = .launchScreen
    
    enum NavigationSection{
        case launchScreen
        case loginView
        case xtreamLoginView
        case profilsView
        case mainView
        case profilLoading
    }
}
