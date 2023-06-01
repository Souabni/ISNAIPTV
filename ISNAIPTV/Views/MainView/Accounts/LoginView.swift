//
//  LoginView.swift
//  ISNAIPTV
//
//  Created by Nader FADHL on 22/05/2023.
//

import SwiftUI

struct LoginView: View {
    @Binding var title: String
    @Binding var link: String
    @Binding var username: String
    @Binding var password: String
    @Binding var alertViewAction : AlertViewAction
    var body: some View {
        VStack(spacing: 30) {
            Text("Add Xtream Codes Compatibles account")
                .foregroundColor(.white)
            VStack {
                TextField("Title", text: $title)
                    .padding(16)
                Divider()
                TextField("Username", text: $username)
                    .padding(16)
                Divider()
                TextField("Password", text: $password)
                    .padding(16)
                Divider()
                TextField("Link", text: $link)
                    .padding(16)
                Divider()
            }
            .background(.white)
            .foregroundColor(.black)
            .padding(20)

            HStack() {
                Spacer()
                Button {
                    alertViewAction = .cancel
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Divider()
                Spacer()
                Button {
                    alertViewAction = .confirm
                } label: {
                    Text("ADD")
                }
                Spacer()

            }
            .background(.white)
            .foregroundColor(.gray)
            .frame(height: 60)
            .padding(30)

        }

    }
}
