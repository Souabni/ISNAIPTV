//
//  AccountsViewModel.swift
//  ISNAIPTV
//
//  Created by Nader FADHL on 22/05/2023.
//

import Foundation
import Combine

class AccountsViewModel: ObservableObject{

    @Published var profils: [Profil]?
    @Published var deleteProfil = false
    @Published var selectedProfil: Profil?

    @Published var displayLoginView = false

    @Published var title: String = ""
    @Published var link: String = ""
    @Published var username: String = ""
    @Published var password: String = ""

    @Published var addProfilAction: AlertViewAction = .cancel

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        self.profils = XtreamRepository.sharedInstance.profils
        sinkAddProfilAction()
    }

    func addProfil() {
        let profil = Profil(title: title, link: link, userName: username, password: password)
        XtreamRepository.sharedInstance.add(profil: profil)
        profils = XtreamRepository.sharedInstance.profils
    }

    func deleteProfil(profil: Profil) {
        XtreamRepository.sharedInstance.delete(profil: profil)
        profils = XtreamRepository.sharedInstance.profils
    }

    func sinkDeleteProfil() {
        $deleteProfil.sink { deleteProfil in
            if deleteProfil, let selectedProfil = self.selectedProfil {
                self.deleteProfil(profil: selectedProfil)
            }
        }
        .store(in: &cancellableSet)
    }

    func sinkAddProfilAction() {
        $addProfilAction.sink { addProfilAction in
            switch addProfilAction {

            case .cancel:
                self.displayLoginView = false
            case .confirm:
                self.addProfil()
                self.displayLoginView = false
            }
        }
        .store(in: &cancellableSet)
    }

}

enum AlertViewAction{
    case cancel
    case confirm
}
