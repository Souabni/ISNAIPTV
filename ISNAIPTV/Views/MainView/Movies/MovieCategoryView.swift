//
//  MovieCategoryView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI
import Kingfisher

struct MovieCategoryView: View {
    
    @StateObject var category: MoviesCategory
    
    @Binding  var selectedCategory: MoviesCategory?
    @Binding  var selectedMovie: Movie?
    var index : Int
    
    var body: some View {
        VStack{
            headerView
                .padding(.horizontal, 8)
            contentView
        }
        .padding(.vertical,12)
        .background(Color.clear)
       // .background(index % 2 == 1 ? Color.getLightColor(index: index/2) : Color.clear)
    }
    
    var headerView: some View {
        HStack{
           
        
            Button{
                selectedCategory = category
            } label:{
                HStack(spacing:4){
                
                    Text(category.title.uppercased())
                        .font(.custom(RobotoFont.bold.rawValue, size: 20))
                    
                    Image("right-arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(height:10
                        )
                }
               
            }
            Spacer()
        }
       // .foregroundColor(index % 2 == 1 ?  Color.black : Color.white)
        .foregroundColor(Color.white)
    }
    
    var contentView: some View{
        ScrollView(.horizontal){
            let gridItemLayout = [GridItem(.flexible())]
            LazyHGrid(rows:gridItemLayout){
                ForEach(category.movies,id:\.name){ movie in
                    Button{
                        DispatchQueue.main.async {
                            selectedMovie = movie
                        }
                    } label:{
                        MovieCell(movie:movie)
                            .frame(width: 200, height: 300)
                            .cornerRadius(5)
                    }
                    .padding(.leading,8)
                }
            }
        }
    }
}

