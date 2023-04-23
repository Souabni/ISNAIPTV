//
//  MovieDetailsView.swift
//  SIPTV
//
//  Created by Dev on 28/08/2022.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var currentXtreamSession : XtreamSession
    
    @ObservedObject var selectedMovie : Movie
    @State var displayVideo : Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .bottom){
                ZStack(alignment: .topTrailing){
                    ZStack{
                        if let movieImage = selectedMovie.iconUrl, let movieImageURL = URL(string:movieImage){
                            KFImage(movieImageURL)
                                .placeholder {
                                    Image("placeholderMovie")
                                        .resizable()
                                        .scaledToFill()
                                }
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth:.infinity)
                                .frame(height: 300,alignment: .top)
                                .clipped()
                        }
                        Button{
                            displayVideo = true
                            let value = UIInterfaceOrientation.landscapeRight.rawValue
                            UIDevice.current.setValue(value, forKey: "orientation")
                        } label:{
                            Image("play")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white)
                                .padding(4)
                                .background(Circle()
                                    .strokeBorder(Color.clear,lineWidth: 0)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(.infinity))
                        }
                    }
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
                    }
                }
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 100)
            }
            VStack(alignment:.leading,spacing:12){
                HStack{
                    Text(selectedMovie.name )
                        .foregroundColor(Color.white)
                        .font(.custom(RobotoFont.bold.rawValue, size: 16))
                    
                    Text(selectedMovie.info?.info?.age ?? "")
                    Spacer()
//                    Button{
////                        let documentDirectory = FileManager.default.urls(for: .documentDirectory,
////                                                                        in: .userDomainMask)[0]
////                        let movieName = documentDirectory.appendingPathComponent("movies\(selectedMovie.movieID)")
////
////                        if let movieUrl = URL(string: selectedMovie.url) {
////                            // 3
////                            URLSession.shared.downloadTask(with: movieUrl) { (tempFileUrl, response, error) in
////
////                                // 4
////                                if let imageTempFileUrl = tempFileUrl {
////                                    do {
////                                        // Write to file
////                                        // 1
////                                        let movieData = try Data(contentsOf: imageTempFileUrl)
////
////                                        // 2
////                                        try movieData.write(to: movieName)
////                                    } catch {
////                                        print("Error")
////                                    }
////                                }
////                            }.resume()
////                        }
//                    } label:{
//                    Image("download")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 20, height: 20)
//                        .padding(.trailing,8)
//                    }
                }
                .frame(height:48)
                
                HStack{
                    ForEach( selectedMovie.genres,id:\.self){genre in
                        Text(genre)
                            .font(.custom(RobotoFont.bold.rawValue, size: 14))
                            .padding(5)
                            .background(.ultraThinMaterial)
                            .cornerRadius(4)
                    }
                }
                
                HStack{
                    Text(selectedMovie.info?.info?.releaseDate ?? "")
                       
                    
                    if let durationSecs = selectedMovie.info?.info?.durationSecs as? Int?, let duration = durationSecs{
                        Text("| \(duration/60)'")
                    }
                    if let durationSecs = selectedMovie.info?.info?.durationSecs as? String{
                        Text("| \(durationSecs)")
                    }
                }
                .foregroundColor(Color.gray)
                .font(.custom(RobotoFont.regular.rawValue, size: 14))
                
                Text(selectedMovie.info?.info?.description ?? "")
                Text("Cast : \(selectedMovie.info?.info?.cast ?? "")")
                    .font(.custom(RobotoFont.regular.rawValue, size: 14))
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .font(.custom(RobotoFont.regular.rawValue, size: 16))
        }
        .background(Color.black)
        .foregroundColor(Color.white)
        .ignoresSafeArea()
        .onAppear{
            currentXtreamSession.xtreamAgent.getVodInfo(vodID: selectedMovie.movieID) { vodInfo in
                DispatchQueue.main.async {
                    print(vodInfo)
                    selectedMovie.info = vodInfo
                }
            }
        }
        .sheet(isPresented: $displayVideo,onDismiss: {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            //presentationMode.wrappedValue.dismiss()
        }) {
            VideoPlayerView(videoURL: selectedMovie.url)
        }
    }
}
