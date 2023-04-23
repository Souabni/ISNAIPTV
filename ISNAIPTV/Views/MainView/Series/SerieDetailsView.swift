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
        ZStack(alignment: .topTrailing){
       
            
                ZStack(alignment: .top){
                    
                    OffsettableScrollView { point in
                        verticalOffset = point.y
                    } content: {
                        ScrollViewReader { value in
                            
                            VStack(alignment: .leading){
                                ZStack(alignment: .bottom){
                                    
                                    ZStack{
                                        if let SerieImage = serieDetailsVM.selectedSerie.iconUrl, let SerieImageURL = URL(string:SerieImage){
                                            KFImage(SerieImageURL)
                                                .placeholder {
                                                    Image("placeholderSerie")
                                                        .resizable()
                                                        .scaledToFill()
                                                }
                                                .resizable()
                                                .scaledToFill()
                                            
                                                .frame(width:geometry.size.width, height: 400,alignment: .top)
                                                .clipped()
                                        }
                                    }
                                    
                                    
                                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
                                        .frame(height: 100)
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
                                    
                                    if let serieSeasons = serieDetailsVM.selectedSerie.seasons, serieSeasons.count > 1{
                                        let sections = serieSeasons.map{$0.name}
                                        SeasonView(sections:sections, selectedSection: $serieDetailsVM.selectedSection)
                                            .padding(.horizontal,-16)
                                            .background(
                                                GeometryReader { geo -> Color in
                                                    DispatchQueue.main.async {
                                                        
                                                        sectionsBarFrame = geo.frame(in: .named("scrollView"))
                                                        
                                                    }
                                                    return Color.black
                                                }
                                            )
                                            .opacity(sectionsBarFrame.origin.y >= 100 ? 1 : 0)
                                    }
                                    
                                    
                                    ForEach (Array(serieDetailsVM.selectedSerie.seasons),id:\.name){season in
                                        
                                        Rectangle()
                                            .frame(width:0,height:0)
                                            .background(
                                                GeometryReader { geo -> Color in
                                                    DispatchQueue.main.async {
                                                        
                                                        let sectionOffset = geo.frame(in: .named("scrollViewContent")).origin.y
                                                        sectionsOffset[season.name] = sectionOffset
                                                    }
                                                    return Color.clear
                                                }
                                            )
                                        ForEach (season.episodes,id:\.id){ episode in
                                            Button{
                                                self.serieDetailsVM.selectedEpisode = episode
                                                self.serieDetailsVM.displayVideo = true
                                            }label:{
                                                EpisodeView(episode:episode, displayVideo: $serieDetailsVM.displayVideo,selectedEpisode:$serieDetailsVM.selectedEpisode)
                                                    .padding(.vertical,10)
                                                
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal,8)
        
                            }
                            
                            .onChange(of:serieDetailsVM.selectedSection){ selectedSection in
                                //  value.scrollTo(serieDetailsVM.selectedSection, anchor: .center)
                                if let scrollView = scrollView {
                                    let currentContentOffset = scrollView.contentOffset
                                    if let sectionOffset = sectionsOffset[selectedSection]{
                                        scrollView.setContentOffset(CGPoint(x: currentContentOffset.x, y: sectionOffset-120), animated: true)
                                    }
                                    
                                }
                                
                            }
                        }
                        .coordinateSpace(name: "scrollViewContent")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.black)
                    .ignoresSafeArea()
                    .coordinateSpace(name: "scrollView")
                    .introspectScrollView { scrollView in
                        self.scrollView = scrollView
                    }
                    
                    VStack(spacing:0){
                        HStack{
                            Spacer()
                            Text(serieDetailsVM.selectedSerie.name)
                                .foregroundColor(Color.white)
                                .font(.custom(RobotoFont.bold.rawValue, size: 16))
                            Spacer()
                        }
                        .padding(.trailing,20)
                        .padding(.top,50)
                        .padding(.bottom,20)
                        .frame(height:100)
                        .background(Color.darkBG)
                        .background(
                                Rectangle()
                                    .fill(Color.darkBG)
                                    .shadow(
                                        color: Color.gray.opacity( titleFrame.origin.y < 80 ? 0.7 : 0),
                                        radius: 1,
                                        x: 0,
                                        y: 0
                                     )
                            )
                        .opacity(titleFrame.origin.y < 80 ? 1 : 0)
                        
                        if let serieSeasons = serieDetailsVM.selectedSerie.seasons, serieSeasons.count > 1{
                            let sections = serieSeasons.map{$0.name}
                            
                            SeasonView(sections:sections, selectedSection: $serieDetailsVM.selectedSection)
    
                                .frame(width: sectionsBarFrame.size.width+32, height: sectionsBarFrame.size.height)
                                .background(Color.darkBG)
                                .background(
                                        Rectangle()
                                            .fill(Color.darkBG)
                                            .shadow(
                                                color: Color.gray.opacity(0.7),
                                                radius: 0.5,
                                                x: 0,
                                                y: 1
                                             )
                                    )
                                .opacity(sectionsBarFrame.origin.y < 100 ? 1 : 0)
                        }
                    }
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .foregroundColor(Color.white)
                .font(.custom(RobotoFont.regular.rawValue, size: 16))
            
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label:{
                    Image("close")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .frame(width: 30, height: 30)
                        .background(Circle()
                            .strokeBorder(Color.clear,lineWidth: 0)
                            .background(.ultraThinMaterial)
                            .cornerRadius(.infinity))
                        .padding(.trailing,20)
                        .padding(.top,50)
                        .foregroundColor(titleFrame.origin.y < 80 ? Color.white : Color.white)
                }
            }
        .foregroundColor(Color.white)
        
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

struct OffsettableScrollView<T: View>: View {
    let axes: Axis.Set
    let showsIndicator: Bool
    let onOffsetChanged: (CGPoint) -> Void
    let content: T
    
    init(axes: Axis.Set = .vertical,
         showsIndicator: Bool = true,
         onOffsetChanged: @escaping (CGPoint) -> Void = { _ in },
         @ViewBuilder content: () -> T
    ) {
        self.axes = axes
        self.showsIndicator = showsIndicator
        self.onOffsetChanged = onOffsetChanged
        self.content = content()
    }
    
    var body: some View {
        ScrollView(axes, showsIndicators: showsIndicator) {
            GeometryReader { proxy in
                Color.clear.preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(
                        in: .named("ScrollViewOrigin")
                    ).origin
                )
            }
            .frame(width: 0, height: 0)
            content
        }
        .coordinateSpace(name: "ScrollViewOrigin")
        .onPreferenceChange(OffsetPreferenceKey.self,
                            perform: onOffsetChanged)
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
}
