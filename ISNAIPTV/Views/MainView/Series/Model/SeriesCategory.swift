//
//  SeriesCategory.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import Foundation

class SeriesCategory: ObservableObject {
    var id: String
    var title: String
    @Published var series : [Serie] = []
   
    init(category:Category){
        self.id = category.id ?? ""
        self.title = category.title ?? ""
    }

}
