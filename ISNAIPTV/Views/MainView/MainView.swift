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
            ZStack(alignment: .bottom ){
                
                switch selectedSection {
                case .movies:
                    MoviesView()
                case .series:
                    SeriesView()
                case .liveTV:
                    LiveTVView()
                }
                
                SectionsBarView(section: $selectedSection)
                    .frame( height:84)
                    .padding(.horizontal,0)
                    .padding(.bottom,0)
                   
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        .navigationViewStyle(.stack)
        }
        
    }
}
