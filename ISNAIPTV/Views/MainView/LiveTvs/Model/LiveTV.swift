//
//  LiveTV.swift
//  SIPTV
//
//  Created by Souabni Issam on 04/09/2022.
//

import Foundation

class LiveTV: ObservableObject{
    
    var num: Int
    var name: String
    var streamID: Int
    var streamIcon: String?
    
    init(liveStream:LiveStream, profil: Profil){
        self.num = liveStream.num ?? 0
        self.name = liveStream.name ?? ""
        self.streamID = liveStream.streamID ?? 0
        self.streamIcon = liveStream.streamIcon
    }
}
