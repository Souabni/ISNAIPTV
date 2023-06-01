//
//  AccountsView.swift
//  ISNAIPTV
//
//  Created by Nader FADHL on 22/05/2023.
//

import SwiftUI

struct AccountsView: View {
    @EnvironmentObject var xtreamManager : XtreamManager
    @StateObject var accountsViewModel = AccountsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                HStack() {
                    Spacer()
                    Text("Accounts")
                        .font(.custom(RobotoFont.bold.rawValue, size: 24))
                    Spacer()
                    Button {
                        accountsViewModel.displayLoginView = true

                    } label: {
                        Image("add")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(20)
                if !(accountsViewModel.profils?.isEmpty ?? true) {
                    ForEach(accountsViewModel.profils ?? [], id: \.userName) { profil in
                        Button {
                            //xtreamManager.xtreamSession.set(profil: profil)
                        } label: {
                            AccountCell(profil: profil)
                        }
                        Divider()
                    }
                }
                Spacer()
            }
            .padding(.vertical, 30)
            if accountsViewModel.displayLoginView {
                LoginView(title: $accountsViewModel.title, link: $accountsViewModel.link, username: $accountsViewModel.username, password: $accountsViewModel.password, alertViewAction: $accountsViewModel.addProfilAction)
                    .frame(height: 600)
                    .background(.gray)
                    .padding(100)

            }

        }

    }
}
