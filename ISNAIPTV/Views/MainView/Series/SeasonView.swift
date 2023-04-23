//
//  SeasonView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI

struct SeasonView: View {
    
    var sections : [String]
    @Binding var selectedSection : String
   
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            let gridItemLayout = [GridItem(.flexible())]
            LazyHGrid(rows:gridItemLayout){
                HStack(spacing:12){
                        ForEach(Array(zip(sections.indices, sections)), id: \.0) { index, section in
                        Button{
                            selectedSection = section
                         
                        }label:{
                            VStack(spacing:4){
                                Text(section)
                                    .font(.custom(RobotoFont.bold.rawValue, size: 14))
                                    .foregroundColor(Color.white)
                                Rectangle()
                                    .strokeBorder(Color.red,lineWidth: 0)
                                    .background(selectedSection == section ? Color.lightBlue: Color.clear)
                                    .frame(height: 5)
                                    .cornerRadius(.infinity)
                                
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
//                            .background(Color.getLightColor(index: index))
//                            .cornerRadius(.infinity)
                           
                        }
                    }
                }
                .padding(.vertical,8)
                .padding(.horizontal,16)
                
            }
        }
    }
}
