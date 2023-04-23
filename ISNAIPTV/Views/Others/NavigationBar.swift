//
//  NavigationBar.swift
//  SIPTV
//
//  Created by Dev on 26/08/2022.
//

import SwiftUI

struct NavigationBar: View {
    var title : String
    var prevAction : ()->()
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 40)
        HStack{
            Button{
                prevAction()
            } label:{
                Image("prev")
                    .resizable()
                    .scaledToFit()
                    .frame(height:30)
                    
            }
            Spacer()
            Text(title)
                .font(.custom(RobotoFont.bold.rawValue, size: 18))
            
            Spacer()
        }
        .foregroundColor(Color.white)
        }
    }
}
