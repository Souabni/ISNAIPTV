//
//  SerieCategoryDetailsView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI
import Kingfisher

struct SerieCategoryDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var category : SeriesCategory?
    
    @State var selectedSerie : Serie?
    @State var displaySerie = false
    
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
                            ForEach(category.series,id:\.name){ serie in
                                Button{
                                    selectedSerie = serie
                                    displaySerie = true
                                } label:{
                                    SerieCell(serie: serie)
                                        .frame(width: 150, height: 225)
                                        .clipped()
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
        .fullScreenCover(isPresented: $displaySerie) {
            if let selectedSerie = selectedSerie{
                SerieDetailsView(serieDetailsVM: SerieDetailsViewModel(selectedSerie: selectedSerie))
            }
        }
    }
}

