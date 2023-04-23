//
//  VideoPlayer.swift
//  SIPTV
//
//  Created by Dev on 28/08/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State var videoURL: String 
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            let player =  AVPlayer(url: URL(string: videoURL)!)
            VideoPlayer(player:  player )
                .ignoresSafeArea()
                .onAppear() {
                    player.play()
                }
        }
        .onAppear {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                    AppDelegate.orientationLock = .landscape // And making sure it stays that way
                }.onDisappear {
                    AppDelegate.orientationLock = .portrait // Unlocking the rotation when leaving the view
                }
    }
}
