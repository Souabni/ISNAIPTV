//
//  MovieCategoryDetailsView.swift
//  SIPTV
//
//  Created by Dev on 26/08/2022.
//

import SwiftUI
import Kingfisher

struct MovieCategoryDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var category : MoviesCategory?
    
    @State var selectedMovie : Movie?
    @State var displayMovie = false
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing:0){
                NavigationBar(title: category?.title ?? "") {
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(width:geometry.size.width,height:94)
                .background(
                        Rectangle()
                            .fill(Color.darkBG)
                            .shadow(
                                color: Color.gray.opacity(0.7),
                                radius: 1,
                                x: 0,
                                y: 0
                             )
                    )
                
                if let category = category {
                    
                    ScrollView{
                        let gridItemLayout = [GridItem(.flexible(minimum: 150)),
                                              GridItem(.flexible(minimum: 150))]
                        LazyVGrid(columns:gridItemLayout, spacing: 30){
                            ForEach(category.movies,id:\.name){ movie in
                                Button{
                                    selectedMovie = movie
                                    displayMovie = true
                                } label:{
                                    MovieCell(movie: movie)
                                        .frame(width: 150, height: 225)
                                }
                            }
                        }
                        .frame(width:geometry.size.width)
                        
                    }
                    .background(Color.darkBG)
                    .ignoresSafeArea()
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $displayMovie) {
            if let selectedMovie = selectedMovie{
                MovieDetailsView(selectedMovie: selectedMovie)
            }
        }
    }
}

