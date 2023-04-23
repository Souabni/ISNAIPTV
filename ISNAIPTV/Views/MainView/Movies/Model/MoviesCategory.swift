//
//  MoviesCategory.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class MoviesCategory: ObservableObject {
    var id: String
    var title: String
    @Published var movies : [Movie] = []
   
    init(category:Category){
        self.id = category.id ?? ""
        self.title = category.title ?? ""
    }

}
