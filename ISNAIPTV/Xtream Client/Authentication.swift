//
//  Authentication.swift
//  XtreamIPTV
//
//  Created by Souabni Issam on 25/09/2022.
//

import Foundation

public struct Authentication: Codable{
    var userInfo: UserInfo?
  //  var serverInfo: ServerInfo?
   
    
    public enum CodingKeys: String, CodingKey {
           case userInfo = "user_info"
       }
}


public struct UserInfo: Codable{
    var username: String?
    var password: String?
    var message: String?
    var auth: Int?
    var status: String?
    var expDate: String?
    var isTrial: String?
    var activeCons: String?
    var createdAt: String?
    var maxConnections: String?
    var allowedOutputFormats: [String]?
    
    
   
    
    public enum CodingKeys: String, CodingKey {
        case username
        case password
        case message
        case auth
        case status
        case expDate = "exp_date"
        case isTrial = "is_trial"
        case activeCons = "active_cons"
        case createdAt = "created_at"
        case maxConnections = "max_connections"
        case allowedOutputFormats = "allowed_output_formats"
       }
}
//
//public struct ServerInfo: Codable{
//    var id: String?
//    var title: String?
//    var parentId: Int?
//
//    public enum CodingKeys: String, CodingKey {
//           case id = "category_id"
//           case title = "category_name"
//           case parentId = "parent_id"
//       }
//}
