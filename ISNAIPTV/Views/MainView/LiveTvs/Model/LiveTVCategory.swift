//
//  LiveTVCategory.swift
//  SIPTV
//
//  Created by Souabni Issam on 04/09/2022.
//

import Foundation

class LiveTVCategory: ObservableObject {
    
    var id: String
    var title: String
    @Published var tvs : [LiveTV] = []
   
    init(category:Category){
        self.id = category.id ?? ""
        self.title = category.title ?? ""
    }
}
