//
//  AccountCell.swift
//  ISNAIPTV
//
//  Created by Nader FADHL on 22/05/2023.
//

import SwiftUI

struct AccountCell: View {
    let profil: Profil
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            VStack() {
                Text(profil.title)
                    .font(.custom(RobotoFont.bold.rawValue, size: 16))
                Text("Username: \(profil.userName)")
                    .font(.custom(RobotoFont.regular.rawValue, size: 16))
            }
            .foregroundColor(.black)
            Button {

            } label: {
                Image("delete alt")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
            Spacer()
        }
        .padding(.horizontal,16)
    }
}

