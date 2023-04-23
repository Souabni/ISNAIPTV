//
//  VodInfo.swift
//  SIPTV
//
//  Created by Souabni Issam on 31/08/2022.
//

import Foundation


struct VodInfo: Codable{
    var info : Info?
    
    
    public enum CodingKeys: String, CodingKey{
        case info
    }
    
    
    struct Info: Codable{
        var tmdbId: String?
        var name: String?
        var oName: String?
        var coverBig:String?
        var movieImage: String?
        var releaseDate: String?
        var youtubeTrailer: String?
        var director: String?
        var actors: String?
        var cast: String?
        var description: String?
        var plot: String?
        var age: String?
        var country: String?
        var genre: String?
        var backdropPath: [String]?
        var durationSecs: Any?
        var bitrate: IntString?
        var rating: String?
        var status: String?
        var runtime: String?
        
        
        /*{   "tmdb_id":"924482",
         "name":"The Ledge (2022)",
         "o_name":"The Ledge (2022)",
         "cover_big":,
         "movie_image":"https:\/\/www.themoviedb.org\/t\/p\/w600_and_h900_bestv2\/d2praYsQxyDtKM67iEanSS418fH.jpg",
         "releasedate":"2022-02-18",
         "youtube_trailer":"MpeeaF5wzoE",
         "director":"Howard J. Ford",
         "actors":"Brittany Ashworth, Ben Lamb, Louis Boyer, Nathan Welsh, Ana\u00efs Parello, David Wayman",
         "cast":"Brittany Ashworth, Ben Lamb, Louis Boyer, Nathan Welsh, Ana\u00efs Parello, David Wayman",
         "description":"Une alpiniste prise au pi\u00e8ge sur la face d'une montagne combat quatre tueurs sur un rebord en surplomb \u00e0 vingt pieds au-dessus d'elle.",
         "plot":"Une alpiniste prise au pi\u00e8ge sur la face d'une montagne combat quatre tueurs sur un rebord en surplomb \u00e0 vingt pieds au-dessus d'elle.",
         "age":"",
         "country":"",
         "genre":"Thriller",
         "backdrop_path":["http:\/\/556677.ovh:25461\/images\/movies\/jazlkwXfw4KdF6fVTRsolOvRCmu.jpg"],
         "duration_secs":5211,
         "duration":"01:26:51",
         "video":{"index":0,"codec_name":"h264","codec_long_name":"H.264 \/ AVC \/ MPEG-4 AVC \/ MPEG-4 part 10","profile":"Main","codec_type":"video","codec_time_base":"32494538\/1558179651","codec_tag_string":"avc1","codec_tag":"0x31637661","width":1920,"height":1080,"coded_width":1920,"coded_height":1088,"has_b_frames":2,"sample_aspect_ratio":"1431:1064","display_aspect_ratio":"318:133","pix_fmt":"yuv420p","level":40,"color_range":"tv","color_space":"bt709","color_transfer":"bt709","color_primaries":"bt709","chroma_location":"left","refs":1,"is_avc":"true","nal_length_size":"4","r_frame_rate":"24000\/1001","avg_frame_rate":"1558179651\/64989076","time_base":"1\/90000","start_pts":0,"start_time":"0.000000","duration_ts":469023553,"duration":"5211.372811","bit_rate":"1996918","bits_per_raw_sample":"8","nb_frames":"124948","disposition":{"default":1,"dub":0,"original":0,"comment":0,"lyrics":0,"karaoke":0,"forced":0,"hearing_impaired":0,"visual_impaired":0,"clean_effects":0,"attached_pic":0,"timed_thumbnails":0},"tags":{"creation_time":"2022-08-30T11:57:25.000000Z","language":"und","handler_name":"VideoHandler"}},
         "audio":{"index":1,"codec_name":"aac","codec_long_name":"AAC (Advanced Audio Coding)","codec_type":"audio","codec_time_base":"1\/48000","codec_tag_string":"mp4a","codec_tag":"0x6134706d","sample_fmt":"fltp","sample_rate":"48000","channels":2,"channel_layout":"stereo","bits_per_sample":0,"r_frame_rate":"0\/0","avg_frame_rate":"0\/0","time_base":"1\/48000","start_pts":896544,"start_time":"18.678000","duration_ts":248477696,"duration":"5176.618667","bit_rate":"160171","max_bit_rate":"160171","nb_frames":"242654","disposition":{"default":1,"dub":0,"original":0,"comment":0,"lyrics":0,"karaoke":0,"forced":0,"hearing_impaired":0,"visual_impaired":0,"clean_effects":0,"attached_pic":0,"timed_thumbnails":0},"tags":{"creation_time":"2022-08-30T11:57:25.000000Z","language":"fra","handler_name":"SoundHandler"}},
         "bitrate":2163,
         "rating":"6.199",
         "status":"Released",
         "runtime":"86"}*/
        
        public enum CodingKeys: String, CodingKey{
            case tmdbId = "tmdb_id"
            case name
            case oName = "o_name"
            case coverBig = "cover_big"
            case movieImage = "movie_image"
            case releaseDate = "releasedate"
            case youtubeTrailer = "youtube_trailer"
            case director
            case actors
            case cast
            case description
            case plot
            case age
            case country
            case genre
            case backdropPath = "backdrop_path"
            //case durationSecs = "duration_secs"
            case bitrate
            case rating
            case status
            case runtime
        }
    }
}
