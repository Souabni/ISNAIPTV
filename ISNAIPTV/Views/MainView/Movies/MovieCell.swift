//
//  MovieCell.swift
//  SIPTV
//
//  Created by Souabni Issam on 30/08/2022.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    var movie: Movie
    
    var body: some View {
        
        if let iconURL = URL(string:movie.iconUrl){
            
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
