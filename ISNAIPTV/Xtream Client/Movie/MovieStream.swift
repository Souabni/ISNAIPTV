//
//  VodStream.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

//{"num":1,"name":"Altrimenti ci arrabbiamo (2022)","stream_type":"movie","stream_id":113936,"stream_icon":"http:\/\/556677.ovh:25461\/images\/movies\/yt40jRlEkpx34XbxlZqvotFRGzW.jpg","rating":"4.4","rating_5based":2.2,"added":"1661356957","category_id":"241","container_extension":"mp4","custom_sid":null,"direct_source":""}


struct MovieStream: Codable{
   
    var num: IntString?
    var name: String?
    var streamType: String?
    var streamID: IntString?
    var streamIcon: String?
    var rating: DoubleString?
    var rating5based : DoubleString?
    var added: String?
    var categoryId: String?
    var containerExtension: String?
    var directSource: String?
    
    
    public enum CodingKeys: String, CodingKey{
        case num
        case name
        case streamType = "stream_type"
        case streamID = "stream_id"
        case streamIcon = "stream_icon"
//        case rating
        case rating5based = "rating_5based"
        case added
        case categoryId = "category_id"
        case containerExtension = "container_extension"
        case directSource = "direct_source"
    }
    
}


enum IntString: Codable {
    case int(Int)
    case string(String)

    var value : Int?{
        switch self {
        case .int(let v): return v
        default: return nil
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let v): try container.encode(v)
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()

        if let v = try? value.decode(Int.self) {
            self = .int(v)
            return
        } else if let v = try? value.decode(String.self), let int = Int(v) {
            self = .int(int)
            return
        }

        throw IntString.ParseError.notRecognizedType(value)
    }

    enum ParseError: Error {
        case notRecognizedType(Any)
    }
}

enum DoubleString: Codable {
    case double(Double)
    case string(String)

    var value : Double?{
        switch self {
        case .double(let v): return v
        default:  return nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let v): try container.encode(v)
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()

        if let v = try? value.decode(Double.self) {
            self = .double(v)
            return
        } else if let v = try? value.decode(String.self), let double = Double(v) {
            // self = .string(v)
            self = .double(double)
            return
        }

        throw DoubleString.ParseError.notRecognizedType(value)
    }

    enum ParseError: Error {
        case notRecognizedType(Any)
    }
}
