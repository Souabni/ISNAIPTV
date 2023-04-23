//
//  MovieModel.swift
//  SIPTV
//
//  Created by Souabni Issam on 30/08/2022.
//

import Foundation

class Movie : ObservableObject{
    var movieID: Int
    var name : String
    var iconUrl: String
    var url: String
    @Published var genres: [String] = []
    @Published var info: VodInfo?{
        didSet{
            if let genre = info?.info?.genre{
                self.genres = genre.split(separator: ",").map{String($0)}
            }
         
        }
    }
    
    init(movieStream:MovieStream, movieUrlBase: String){
        self.movieID = movieStream.streamID?.value ?? 0
        self.name = movieStream.name ?? ""
       
        self.iconUrl = movieStream.streamIcon ?? ""
       
        let videoID = movieStream.streamID?.value ?? 0
        let containerExtension = movieStream.containerExtension ?? "mp4"
        self.url = "\(movieUrlBase)\(videoID).\(containerExtension)"
       
        
    }
    
}
