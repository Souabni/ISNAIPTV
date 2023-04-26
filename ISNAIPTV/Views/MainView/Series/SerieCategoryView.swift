//
//  SerieCategoryView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//


import SwiftUI
import Kingfisher

struct SerieCategoryView: View {
    
    @StateObject var category: SeriesCategory
    
    @Binding  var selectedCategory: SeriesCategory?
    @Binding  var selectedSerie: Serie?
    var index : Int
    
    var body: some View {
        VStack{
            headerView
                .padding(.horizontal, 8)
            contentView
        }
        .padding(.vertical,12)
        //.background(index % 2 == 1 ? Color.getLightColor(index: index/2) : Color.clear)
        .background(Color.clear)
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
            .foregroundColor(Color.white)
            //.foregroundColor(index % 2 == 1 ?  Color.black : Color.white)
            Spacer()
        }
    }
    
    var contentView: some View{
        ScrollView(.horizontal){
            let gridItemLayout = [GridItem(.flexible())]
            LazyHGrid(rows:gridItemLayout){
                ForEach(category.series,id:\.name){ serie in
                    Button{
                        DispatchQueue.main.async {
                            selectedSerie = serie
                        }
                    } label:{
                        SerieCell(serie:serie)
                            .frame(width: 200, height: 300)
                            .clipped()
                            .cornerRadius(5)
                    }
                    .padding(.leading,8)
                }
            }
        }
    }
}

