//
//  LaunchscreenView.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import SwiftUI

struct LaunchscreenView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .center) {
                Spacer()
                Image("Launchscreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width:190)
                Spacer()
            }
            .frame(width: geometry.size.width,height: geometry.size.height)
            .background(Color.darkBG)
        }
    }
}

