//
//  MainView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct MainView: View {
    @State var selectedSection : Section = .movies
    var body: some View {
        GeometryReader { geometry in
        NavigationView{
            HStack(spacing:0){
                SectionsBarView(section: $selectedSection)
                    .frame( width:84)
                    .padding(.vertical,0)
                    .padding(.leading,0)
                
                switch selectedSection {
                case .movies:
                    MoviesView()
                case .series:
                    SeriesView()
                case .liveTV:
                    LiveTVView()
                }
                
              
                   
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        .navigationViewStyle(.stack)
        }
        
    }
}
