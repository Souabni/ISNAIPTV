//
//  SerieCell.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI
import Kingfisher

struct SerieCell: View {
    var serie: Serie
    
    var body: some View {
        
        if let iconURL = URL(string:serie.iconUrl){
            
            KFImage(iconURL)
                .placeholder {
                    Image("placeholderMovie")
                        .resizable()
                        .scaledToFill()
                    
                }
                .resizable()
                .scaledToFill()
                .clipped()
                
            
        }
        else{
            Color.black
        }
    }
}
