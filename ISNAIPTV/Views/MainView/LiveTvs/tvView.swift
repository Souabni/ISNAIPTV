//
//  tvView.swift
//  SIPTV
//
//  Created by Souabni Issam on 04/09/2022.
//

import SwiftUI
import Kingfisher

struct tvView: View {
    
    var liveTV : LiveTV
    var color : Color
    
    var body: some View {
            HStack{
               ZStack{
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width:50, height: 50)
                       // .cornerRadius(5)
                    if let tvIcone = liveTV.streamIcon, !tvIcone.isEmpty, let tvIconeURL = URL(string: tvIcone) {
                        KFImage(tvIconeURL)
                            .resizable()
                            .scaledToFit()
                            .frame(width:50)

                    }
                }
                .background(Color.gray)
                .frame(width:50, height: 50)
                .cornerRadius(5)
                
                Text(liveTV.name)
                    .lineLimit(2)
                    .font(.custom(RobotoFont.regular.rawValue, size: 16))
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .background(Color.clear)
    }
}


