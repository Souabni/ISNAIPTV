//
//  MoviesView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject var currentSession : XtreamSession
    
    @State private var selectedCategory : MoviesCategory?
    @State private var displaySelectedCategory : Bool = false
    
    @State private var selectedMovie : Movie?
    @State private var displayMovie : Bool = false
    
    var body: some View {
        let selectedCategoryBinding = Binding(
            get: { self.selectedCategory },
            set: { self.selectedCategory = $0
                displaySelectedCategory = true
            }
        )
        
        let selectedMovieBinding = Binding(
            get: { self.selectedMovie },
            set: { self.selectedMovie = $0
                displayMovie = true
            }
        )
        
        ScrollView{
            VStack{
                Spacer()
                    .frame(height: 84)
                let gridItemLayout = [GridItem(.flexible())]
                LazyVGrid(columns: gridItemLayout){
                    ForEach(Array(zip(currentSession.moviesCategories.indices, currentSession.moviesCategories)), id: \.0) { index, category in
                        MovieCategoryView(category: category,selectedCategory: selectedCategoryBinding, selectedMovie: selectedMovieBinding,index:index)
                            
                    }
                }
                Spacer()
                NavigationLink(destination: MovieCategoryDetailsView(category: selectedCategory),
                               isActive: $displaySelectedCategory) {
                    EmptyView()
                }
            }
        }
        .background(Color.darkBG)
        .fullScreenCover(isPresented: $displayMovie) {
            if let selectedMovie = self.selectedMovie{
                MovieDetailsView(selectedMovie: selectedMovie)
            }
        }
    }
}

