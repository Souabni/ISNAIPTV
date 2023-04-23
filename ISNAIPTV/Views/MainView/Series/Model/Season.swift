//
//  Season.swift
//  SIPTV
//
//  Created by Souabni Issam on 02/09/2022.
//

import Foundation

class Season: ObservableObject{
    var name : String = ""
    var seasonNumber = 0
    var episodes : [Episode] = []
}
