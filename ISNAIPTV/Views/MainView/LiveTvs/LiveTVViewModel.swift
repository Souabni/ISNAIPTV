//
//  LiveTVViewModel.swift
//  SIPTV
//
//  Created by Souabni Issam on 04/09/2022.
//

import Foundation

class LiveTVViewModel: ObservableObject{
    
    @Published var selectedTV : LiveTV?
    @Published var displayTV : Bool = false
    @Published var selectedCategory : LiveTVCategory?
    
    init(){
  
    }
    
}
