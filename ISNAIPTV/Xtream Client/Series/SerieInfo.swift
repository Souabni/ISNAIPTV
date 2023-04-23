//
//  SerieInfo.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import Foundation

struct SerieInfo: Codable{
    var seasons : [SeasonInfo]?
    var info : SeriesStream?
    var episodes : [String:[EpisodeInfo]]?
    
    public enum CodingKeys: String, CodingKey{
        case seasons
        case info
        case episodes
    }


struct SeasonInfo: Codable{
    var id : IntString?
    var name : String?
    var airDate : String?
    var episodeCount : IntString?
    var overview : String?
    var seasonNumber : IntString?
    var cover : String?
    var coverBig : String?
    
    public enum CodingKeys: String, CodingKey{
        case id
        case name
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case overview
        case seasonNumber = "season_number"
        case cover
        case coverBig = "cover_big"
    }
}

struct EpisodeInfo: Codable{
    var id: String?
    var episodeNum: Int?
    var title: String?
    var containerExtension: String?
    var info: Info?
    var customSid: String?
    var added: String?
    var season: Int?
    var directSource: String?
    
    public enum CodingKeys: String, CodingKey{
        case id
        case episodeNum = "episode_num"
        case title
        case containerExtension = "container_extension"
        case info
        case customSid = "custom_sid"
        case added
        case season
        case directSource = "direct_source"
        
    }
    
    
    struct Info: Codable{
        var releasedate: String?
        var plot: String?
        //    var durationSecs: Int?
        //    var duration: String?
           var movieImage: String?
        //    var bitrate: Int?
        //    var rating: String?
        //    var season: String?
        //    var tmdbId: String?
        //
        public enum CodingKeys: String, CodingKey{
            case releasedate
            case plot
            //        case durationSecs = "duration_secs"
            //        case duration
                    case movieImage = "movie_image"
            //        case bitrate
            //        case rating
            //        case season
            //        case tmdbId = "tmdb_id"
        }
    }
}
}
