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
 
    
    @Published var currentProfil: Profil? = Profil(title: XtreamConfig().name,
                                                  link: XtreamConfig().url,
                                                  userName: XtreamConfig().username,
                                                  password: XtreamConfig().password)
   
    var xtreamSession: XtreamSession
    
    init(){
        xtreamSession = XtreamSession(profil: Profil(title: XtreamConfig().name,
                                                     link: XtreamConfig().url,
                                                     userName: XtreamConfig().username,
                                                     password: XtreamConfig().password))
    }
    
}
