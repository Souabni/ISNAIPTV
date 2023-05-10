//
//  LiveTVView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct LiveTVView: View {
    @EnvironmentObject var currentSession : XtreamSession
    @StateObject var LiveTVVM : LiveTVViewModel =  LiveTVViewModel()
    @State var selectedCategoryIndex = 0
    
    
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing:16){
                        ForEach(Array(zip(currentSession.liveTVsCategories.indices, currentSession.liveTVsCategories)), id: \.0) {index, category in
                          
                            Button{
                                LiveTVVM.selectedCategory = category
                                selectedCategoryIndex = index
                            } label:{
                                Text(category.title.uppercased())
                                    .font(.custom(RobotoFont.bold.rawValue, size: 20))
                            }
                            .padding(.vertical, 15)
                            .frame(width: 250)
                            .foregroundColor(LiveTVVM.selectedCategory?.id == category.id ? Color.black : Color.white)
                            .background( LiveTVVM.selectedCategory?.id == category.id ? Color.lightBlue : Color.darkBG)
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                }
                .frame(width: 250)
                .padding(.top,50)
                
                
                if  let selectedCategory = LiveTVVM.selectedCategory{
                    ScrollView{
                        //  GeometryReader { geometry in
                        VStack{
                            let gridItemLayout = [GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150)),
                                                  GridItem(.flexible(minimum: 150))]
                            LazyVGrid(columns:gridItemLayout, spacing: 30){
                                ForEach(selectedCategory.tvs,id:\.num){tv in
                                    Button{
                                        LiveTVVM.selectedTV = tv
                                        LiveTVVM.displayTV = true
                                    } label:{
                                        TVView(liveTV: tv,color:Color.getLightColor(index: selectedCategoryIndex))
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding(.vertical,16)
                        //  }
                    }
                    .frame(width: geometry.size.width-250)
                    .foregroundColor(Color.white)
                    .background(Color.clear)
                    .sheet(isPresented: $LiveTVVM.displayTV ,onDismiss: {
                        //  let value = UIInterfaceOrientation.portrait.rawValue
                        //  UIDevice.current.setValue(value, forKey: "orientation")
                        //  presentationMode.wrappedValue.dismiss()
                    }) {
                        if let selectedTV = LiveTVVM.selectedTV{
                            LiveVideoPlayerView(videoURL: "http://556677.ovh:25461/hn8rr4tp/opjmhaga/\(selectedTV.streamID)")
                        }
                    }
                }
                
            }
            .background(Color.darkBG)
        }
        .onAppear{
            LiveTVVM.selectedCategory = currentSession.liveTVsCategories.first
        }
        
    }
}
