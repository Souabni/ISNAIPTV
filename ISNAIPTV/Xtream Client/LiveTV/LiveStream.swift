//
//  LiveStream.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

//{"num":40,"name":"beIN SPORTS ENGLISH HD1","stream_type":"live","stream_id":41827,"stream_icon":"","epg_channel_id":"","added":"1600791589","category_id":"157","custom_sid":null,"tv_archive":0,"direct_source":"","tv_archive_duration":0},
struct LiveStream: Codable{
    var num: Int?
    var name: String?
    var streamType: String?
    var streamID: Int?
    var streamIcon: String?
    var epgChannelID: String?
    var added: String?
    var categoryID: String?
    var tvArchive: Int?
    var directSource: String?
    var tvArchiveDuration: IntString?
    
    public enum CodingKeys: String, CodingKey {
        case num
        case name
        case streamType = "stream_type"
        case streamID = "stream_id"
        case streamIcon = "stream_icon"
        case epgChannelID = "epg_channel_id"
        case added
        case categoryID = "category_id"
        case tvArchive = "tv_archive"
        case directSource = "direct_source"
        case tvArchiveDuration = "tv_archive_duration"
       }
    
}
