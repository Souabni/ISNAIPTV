//
//  Episode.swift
//  SIPTV
//
//  Created by Souabni Issam on 02/09/2022.
//

import Foundation

class Episode: ObservableObject{
    
    var id: String
    var episodeNum: Int
    var title: String
    var description: String
    var coverUrl: String
    var url : String
    var releaseDate : String
   
    internal init(id: String, episodeNum: Int, title: String,description: String,coverUrl:String,seriesUrlBase:String,releaseDate : String) {
        self.id = id
        self.episodeNum = episodeNum
        self.title = title
        self.description = description
        self.coverUrl = coverUrl
        self.url = "\(seriesUrlBase)\(id).mp4"
        self.releaseDate = releaseDate
    }
    
}
