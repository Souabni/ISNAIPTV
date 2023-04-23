//
//  Category.swift
//  SIPTV
//
//  Created by Dev on 24/08/2022.
//

import Foundation

public struct Category: Codable{
    var id: String?
    var title: String?
    var parentId: Int?
    
    public enum CodingKeys: String, CodingKey {
           case id = "category_id"
           case title = "category_name"
           case parentId = "parent_id"
       }
}
