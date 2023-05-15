//
//  SerieDetailsView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI
import Kingfisher
import Introspect

struct SerieDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var serieDetailsVM : SerieDetailsViewModel
    
    @State private var verticalOffset: CGFloat = 0.0
    @State private var titleFrame: CGRect = CGRect.zero
    @State private var sectionsBarFrame: CGRect = CGRect.zero
    @State private var scrollView: UIScrollView?
    
    @State private var sectionsOffset: [String:CGFloat] = [:]
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                NavigationBar(title: "") {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                
                HStack(alignment: .top){
                    
                    if let SerieImage = serieDetailsVM.selectedSerie.iconUrl, let SerieImageURL = URL(string:SerieImage){
                        KFImage(SerieImageURL)
                            .placeholder {
                                Image("placeholderSerie")
                                    .resizable()
                                    .scaledToFill()
                            }
                            .resizable()
                            .scaledToFit()
                        
                            .frame(width:300, height: 400)
                       
                    }
                    
                    VStack(alignment:.leading,spacing:12){
                        HStack{
                            Text(serieDetailsVM.selectedSerie.name)
                                .foregroundColor(Color.white)
                                .font(.custom(RobotoFont.bold.rawValue, size: 16))
                            Spacer()
                        }
                        .background(
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    
                                    titleFrame = geo.frame(in: .named("scrollView"))
                                    
                                }
                                return Color.clear
                            }
                        )
                        
                        HStack{
                            ForEach( serieDetailsVM.selectedSerie.genres,id:\.self){genre in
                                Text(genre)
                                    .font(.custom(RobotoFont.bold.rawValue, size: 14))
                                    .padding(5)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(4)
                            }
                        }
                        
                        Text(serieDetailsVM.selectedSerie.description)
                        
                        Text("Cast: \(serieDetailsVM.selectedSerie.cast ?? "")")
                            .font(.custom(RobotoFont.regular.rawValue, size: 14))
                            .foregroundColor(Color.gray)
                        
                    
                        
                        
                        //                                    ForEach (Array(serieDetailsVM.selectedSerie.seasons),id:\.name){season in
                        //
                        //                                        Rectangle()
                        //                                            .frame(width:0,height:0)
                        //                                            .background(
                        //                                                GeometryReader { geo -> Color in
                        //                                                    DispatchQueue.main.async {
                        //
                        //                                                        let sectionOffset = geo.frame(in: .named("scrollViewContent")).origin.y
                        //                                                        sectionsOffset[season.name] = sectionOffset
                        //                                                    }
                        //                                                    return Color.clear
                        //                                                }
                        //                                            )
                        //                                        ForEach (season.episodes,id:\.id){ episode in
                        //                                            Button{
                        //                                                self.serieDetailsVM.selectedEpisode = episode
                        //                                                self.serieDetailsVM.displayVideo = true
                        //                                            }label:{
                        //                                                EpisodeView(episode:episode, displayVideo: $serieDetailsVM.displayVideo,selectedEpisode:$serieDetailsVM.selectedEpisode)
                        //                                                    .padding(.vertical,10)
                        //
                        //                                            }
                        //                                        }
                        //                                    }
                        
                
                    }
                    .padding(.horizontal,8)
                    
                }
                HStack{
                    if let serieSeasons = serieDetailsVM.selectedSerie.seasons, serieSeasons.count > 1{
                        let sections = serieSeasons.map{$0.name}
                        SeasonView(sections:sections, selectedSection: $serieDetailsVM.selectedSection)
                            .padding(.horizontal,-16)
                    }
                }
                .frame(height: 44)
                Spacer()
            }
            .background(Color.black)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $serieDetailsVM.displayVideo,onDismiss: {
            //            let value = UIInterfaceOrientation.portrait.rawValue
            //            UIDevice.current.setValue(value, forKey: "orientation")
            //presentationMode.wrappedValue.dismiss()
        }) {
            if let selectedEpisode = serieDetailsVM.selectedEpisode{
                VideoPlayerView(videoURL: selectedEpisode.url)
            }
        }
        .onAppear(){
            serieDetailsVM.getSerieInfo()
        }
    }
}


