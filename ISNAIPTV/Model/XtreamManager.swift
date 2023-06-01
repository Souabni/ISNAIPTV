//
//  XtreamManager.swift
//  ISNAIPTV
//
//  Created by Dev on 23/04/2023.
//

import Foundation

class XtreamManager: ObservableObject{
    
   public static let sharedInstance = XtreamManager()
    var xtreamRepository = XtreamRepository.sharedInstance

    var xtreamSession: XtreamSession?
    
    init(){
       setup()
    }

    func setup() {
        let profil =  Profil(title: XtreamConfig().name,
                             link: XtreamConfig().url,
                             userName: XtreamConfig().username,
                             password: XtreamConfig().password)
        xtreamSession = XtreamSession(profil: profil)

    }


}
