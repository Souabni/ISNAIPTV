//
//  Serie.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import Foundation

class Serie: ObservableObject{
    
    @Published var serieID: Int
    @Published var name : String
    @Published var iconUrl: String
    @Published var coverUrl: String?
    @Published var description: String
    @Published var rating5based: Double?

    @Published var cast: String?
   
    @Published var genres: [String] = []
    var seasonsInfo: [Season] = []
    @Published var seasons: [Season] = []
    
    @Published var info: SerieInfo?
    {
        didSet{
            if let genre = info?.info?.genre{
                self.genres = genre.split(separator: ",").map{String($0)}
            }
         
        }
    }
    var seriesUrlBase : String
    
    init(serieStream:SeriesStream,seriesUrlBase:String){
        self.serieID = serieStream.seriesID?.value ?? 0
        self.name = serieStream.name ?? ""
        self.iconUrl = serieStream.cover ?? ""
        self.description = serieStream.plot ?? ""
        self.seriesUrlBase = seriesUrlBase
    }
   
    func set(info:SerieInfo){
        self.info = info
        self.rating5based = info.info?.rating5based?.value
  
        self.cast = info.info?.cast
        
        if let seasonsInfos = info.seasons{
            seasons.removeAll()
            for seasonInfo in seasonsInfos{
                let season = Season()
                season.name = seasonInfo.name ?? ""
                season.seasonNumber = seasonInfo.seasonNumber?.value ?? 0
                self.seasonsInfo.append(season)
            }
        }
        
        if let keys = info.episodes?.keys{
            for key in keys.sorted(by: <){
           
                if let seasonInfo = info.episodes?[key]{
                    let season = Season()
                    for episodeInfo in seasonInfo{
                        let episode = Episode(id: episodeInfo.id ?? "", episodeNum: episodeInfo.episodeNum ?? 0, title: episodeInfo.title ?? "",description: episodeInfo.info?.plot ?? "",coverUrl: episodeInfo.info?.movieImage ?? "", seriesUrlBase: seriesUrlBase,releaseDate: episodeInfo.info?.releasedate ?? "")
                        season.episodes.append(episode)
                    }
                     if let seasonInfo = seasonsInfo.filter({String($0.seasonNumber) == key}).first{
                         season.name = seasonInfo.name
                         season.seasonNumber = seasonInfo.seasonNumber
                     }
                    seasons.append(season)
                }
                
            }
        }
        
    }
}
