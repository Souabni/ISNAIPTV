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
    @EnvironmentObject var currentSession : XtreamSession
    
    @State var category : MoviesCategory?
    @State var selectedMovie : Movie?
    @State var displayMovie = false
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(title: category?.title ?? "") {
                presentationMode.wrappedValue.dismiss()
            }
            GeometryReader{ geometry in
                HStack(spacing: 0) {
                    ScrollView {
                        let columns = [
                            GridItem(.flexible())
                        ]
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(currentSession.moviesCategories, id: \.id) { category in
                                Button{
                                    self.category = category
                                } label:{
                                    Text(category.title.uppercased())
                                        .font(.custom(RobotoFont.bold.rawValue, size: 20))
                                }
                                .padding(.vertical, 15)
                                .frame(width: 250)
                                .foregroundColor(.white)
                                .background(self.category?.id == category.id ? Color.lightBlue : Color.darkBG)
                            }
                        }
                    }
                    .frame(width: 250)



                    if let category = category {

                        ScrollView{
                            let gridItemLayout = [GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150))]
                            LazyVGrid(columns:gridItemLayout, spacing: 30){
                                ForEach(category.movies,id:\.name){ movie in
                                    Button{
                                        selectedMovie = movie
                                        displayMovie = true
                                    } label:{
                                        MovieCell(movie: movie)
                                            .frame(width: 200, height: 300)
                                    }
                                }
                            }
                            .frame(width:geometry.size.width)

                        }
                    }
                }
            }
        }
        .background(Color.darkBG)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $displayMovie) {
            if let selectedMovie = selectedMovie{
                MovieDetailsView(selectedMovie: selectedMovie)
            }
        }
    }
}

