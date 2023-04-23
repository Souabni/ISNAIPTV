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
        VStack{
           
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:16){
                    ForEach(Array(zip(currentSession.liveTVsCategories.indices, currentSession.liveTVsCategories)), id: \.0) {index, category in
                            Button{
                                LiveTVVM.selectedCategory = category
                                selectedCategoryIndex = index
                            } label:{
                                Text(category.title)
                                    .font(.custom(RobotoFont.bold.rawValue, size: 14))
                                    .foregroundColor(Color.black)
                                    .padding(.vertical,4)
                                    .padding(.horizontal,8)
                                    .frame(minWidth:100)
                                    .background(Color.getLightColor(index: index))
                                    .cornerRadius(.infinity)
                            }
                        }
                }
                .padding(.horizontal, 16)
                .frame(height: 30)
            }
            .frame(height: 30)
            .background(Color.clear)
            .padding(.top,50)
            
            if  let selectedCategory = LiveTVVM.selectedCategory{
                ScrollView{
                  //  GeometryReader { geometry in
                    VStack{
                        let gridItemLayout = [GridItem(.flexible(minimum: 150))]
                        LazyVGrid(columns:gridItemLayout, spacing: 30){
                            ForEach(selectedCategory.tvs,id:\.num){tv in
                                Button{
                                    LiveTVVM.selectedTV = tv
                                    LiveTVVM.displayTV = true
                                } label:{
                                    tvView(liveTV: tv,color:Color.getLightColor(index: selectedCategoryIndex))
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical,16)
                  //  }
                }
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
            }else{
                Spacer()
                Text("no tvs")
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .background(Color.darkBG)
    }
}
