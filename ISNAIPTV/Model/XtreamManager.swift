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
    var xtreamSession: XtreamSession
    
    init(){
        xtreamSession = XtreamSession(profil:xtreamRepository.currentProfil)
    }
    
}
