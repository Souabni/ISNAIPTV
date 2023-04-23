//
//  ProfilLoadingViewModel.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import Foundation
import Combine

class ProfilLoadingViewModel:ObservableObject{
    
    @Published var moviesLoaded = false
    @Published var seriesLoaded = false
    @Published var liveTVsLoaded = false

    @Published var displayMainView = false

    private var cancellableSet: Set<AnyCancellable> = []
    
    init(){
        XtreamManager.sharedInstance.xtreamSession.$moviesLoaded.assign(to: \.moviesLoaded, on: self)
        .store(in: &cancellableSet)
        XtreamManager.sharedInstance.xtreamSession.$seriesLoaded.assign(to: \.seriesLoaded, on: self)
        .store(in: &cancellableSet)
        XtreamManager.sharedInstance.xtreamSession.$livesLoaded.assign(to: \.liveTVsLoaded, on: self)
        .store(in: &cancellableSet)
        
        Publishers.CombineLatest3($moviesLoaded, $seriesLoaded, $liveTVsLoaded).receive(on: RunLoop.main).map{ (moviesLoaded, seriesLoaded, liveTVsLoaded) in
            moviesLoaded && seriesLoaded && liveTVsLoaded
        }
        .assign(to: \.displayMainView, on: self)
        .store(in: &cancellableSet)
    }
    
    func loadSession(){
        XtreamManager.sharedInstance.xtreamSession.loadSession()
    }
}
