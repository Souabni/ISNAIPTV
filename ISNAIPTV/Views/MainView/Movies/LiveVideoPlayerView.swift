//
//  LiveVideoPlayerView.swift
//  SIPTV
//
//  Created by Souabni Issam on 04/09/2022.
//

import SwiftUI
import AVKit

struct LiveVideoPlayerView: View {
    
    @State var videoURL: String
    
    var body: some View {
        GeometryReader{ geometry in
            
//            VlcPlayer(url: videoURL)
//                .frame(maxWidth: .infinity,maxHeight: .infinity)
//            
            
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.async {
//                UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation") // Forcing the rotation to portrait
//                AppDelegate.orientationLock = .landscape // And making sure it stays that way
            }
        }.onDisappear {
            DispatchQueue.main.async {
                AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
            }
        }
    }
}
