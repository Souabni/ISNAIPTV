//
//  SeriesStream.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

//{"num":1,
//    "name":"",
//    "series_id":70,
//    "cover":"https:\/\/i1.wp.com\/mosalsalateonline.com\/wp-content\/uploads\/2021\/09\/%D9%85%D8%B3%D9%84%D8%B3%D9%84-%D8%A7%D9%84%D9%87%D9%8A%D8%A8%D8%A9-5.jpg?fit=290%2C380&ssl=1",
//    "plot":"",
//    "cast":"\u062a\u064a\u0645 \u062d\u0633\u0646, \u0645\u0646\u0649 \u0648\u0627\u0635\u0641, \u0623\u0648\u064a\u0633 \u0645\u062e\u0644\u0644\u0627\u062a\u064a, \u0639\u0628\u062f\u0648 \u0634\u0627\u0647\u064a\u0646, Nicole Saba",
//    "director":"Samer Al Barkawi",
//    "genre":"Drame",
//    "releaseDate":"2019-05-27",
//    "last_modified":"1637921959",
//    "rating":"7",
//    "rating_5based":3.5,
//    "backdrop_path":["http:\/\/123orca.com:25461\/images\/84299_tv_backdrop_0.jpg"],
//    "youtube_trailer":"",
//    "episode_run_time":"0",
//    "category_id":"222"}

struct SeriesStream: Codable{
    
    var num : IntString?
    var name: String?
    var seriesID: IntString?
    var cover: String?
    var plot: String?
    var cast: String?
    var director: String?
    var genre: String?
    var releaseDate: String?
    var lastModified: String?
    var rating: String?
    var rating5based: DoubleString?
   // var backdropPath: [String]?
    var youtubeTrailer: String?
    var episodeRunTime: String?
    var categoryId: String?
    
    public enum CodingKeys: String, CodingKey{
        case num
        case name
        case seriesID = "series_id"
        case cover
        case plot
        case cast
        case director
        case genre
        case releaseDate
        case lastModified = "last_modified"
        case rating
        case rating5based = "rating_5based"
        //case backdropPath = "backdrop_path"
        case youtubeTrailer = "youtube_trailer"
        case episodeRunTime = "episode_run_time"
        case categoryId = "category_id"
    }
}
