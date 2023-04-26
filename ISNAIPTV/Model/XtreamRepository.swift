//
//  XtreamManager.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class XtreamRepository: ObservableObject{
    public static let sharedInstance = XtreamRepository()
    
    var profils : [Profil] = [
                                Profil(title: "orca",
                                link: "",
                                userName: "",
                                password: "")
    ]
    
    
    
   
    
    
    private init() {
        do {
            if let storedObjItem = UserDefaults.standard.object(forKey: "profils"){
                let storedItems = try JSONDecoder().decode([Profil].self, from: storedObjItem as! Data)
                profils = storedItems
            }
        } catch let err {
            print(err)
        }
    }
    
    
    func add(profil: Profil){
        profils.append(profil)
        //Storing Items
        if let encoded = try? JSONEncoder().encode(profils) {
            UserDefaults.standard.set(encoded, forKey: "profils")
        }
    }
    
    func delete(profil: Profil){
        profils.removeAll { $0.title == profil.title }
        //Storing Items
        if let encoded = try? JSONEncoder().encode(profils) {
            UserDefaults.standard.set(encoded, forKey: "profils")
        }
    }
    
}  
