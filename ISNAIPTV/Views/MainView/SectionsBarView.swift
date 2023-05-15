//
//  SectionsBarView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct SectionsBarView: View {
    @EnvironmentObject var navigationManager : NavigationManager
    
    @Binding var section : Section
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack{
                Spacer()
                Button{
                    section = .movies
                } label:{
                    VStack{
                        Image("movie")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Movies")
                    }
                }
                Spacer()
                Button{
                    section = .series
                } label:{
                    VStack{
                        Image("series")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("series")
                    }
                }
                Spacer()
                Button{
                    section = .liveTV
                } label:{
                    VStack{
                        Image("tv")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Live Tv")
                        
                    }
                }
                
                Spacer()
                Button{
                  //  navigationManager.navigationSection = .profilsView
                } label:{
                    VStack{
                        Image("profil")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Profils")
                    }
                }
                Spacer()
            }
            .padding(.horizontal,16)
            .padding(.bottom,16)
            .foregroundColor(Color.white)
            .font(.custom(RobotoFont.bold.rawValue, size: 12))
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        //.background(.ultraThinMaterial)
        .background(Color.darkBG)
      //  .cornerRadius(20, corners: [.topLeft,.topRight])
    }
}

enum Section{
    case movies
    case series
    case liveTV
}
