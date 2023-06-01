//
//  XtreamSession.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class XtreamSession: ObservableObject{
    
    var profil: Profil
    var xtreamAgent : XtreamAgent
    
    @Published var moviesCategories : [MoviesCategory] = []
    @Published var seriesCategories : [SeriesCategory] = []
    @Published var liveTVsCategories : [LiveTVCategory] = []
    
    var nbLoadedMoviesCategories = 0
    var nbLoadedSeriesCategories = 0
    var nbLoadedLivesCategories = 0
    
    @Published var moviesLoaded = false
    @Published var seriesLoaded = false
    @Published var livesLoaded = false
    
    init(profil:Profil){
        self.profil = profil
        xtreamAgent  = XtreamAgent(profil: profil)
      //  loadSession()
        set(profil:self.profil)
    }
    
    func set(profil:Profil){
        moviesCategories  = []
        seriesCategories  = []
        liveTVsCategories = []
        
        nbLoadedMoviesCategories = 0
        nbLoadedSeriesCategories = 0
        nbLoadedLivesCategories = 0
        self.profil = profil
        xtreamAgent  = XtreamAgent(profil: profil)
        loadSession()
    }
    
    func loadSession(){
        loadMoviesCategories()
        loadSeriesCategories()
        loadLivesCategories()
    }
    
    func loadMoviesCategories(){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getVodCategories{categories in
            DispatchQueue.main.async {
                
                for category in categories {
                    let moviesCategory = MoviesCategory(category: category)
                    self.moviesCategories.append(moviesCategory)
                }
                self.loadMovies()
            }
        }
    }
    
    func loadMovies(){
        
        if self.nbLoadedMoviesCategories < moviesCategories.count{
            loadMovies(for: moviesCategories[nbLoadedMoviesCategories]) {
                self.nbLoadedMoviesCategories += 1
                self.loadMovies()
            }
        }
        moviesLoaded = true
    }
    
    func loadMovies(for category:MoviesCategory, completion:@escaping ()->()){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getVodStreams(categoryID: category.id) { vodStreams in
            DispatchQueue.main.async {
                let movieModels = vodStreams.map { vodStream -> Movie in
                    let movieUrlBase = "\(self.profil.link)/movie/\(self.profil.userName)/\(self.profil.password)/"
                   return Movie(movieStream: vodStream,movieUrlBase: movieUrlBase)
                }
                category.movies =  movieModels
                completion()
            }
        }
    }
    
    
    func loadSeriesCategories(){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getSeriesCategories{categories in
            DispatchQueue.main.async {
                
                for category in categories {
                    let seriesCategory = SeriesCategory(category: category)
                    self.seriesCategories.append(seriesCategory)
                }
                self.loadSeries()
            }
        }
    }
    
    func loadSeries(){
        
        if self.nbLoadedSeriesCategories < seriesCategories.count{
            loadSeries(for: seriesCategories[nbLoadedSeriesCategories]) {
                self.nbLoadedSeriesCategories += 1
                self.loadSeries()
            }
        }
        seriesLoaded = true
    }
    
    func loadSeries(for category:SeriesCategory, completion:@escaping ()->()){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getSeriesStreams(categoryID: category.id) { serieStreams in
            DispatchQueue.main.async {
                let serieModels = serieStreams.map { serieStream -> Serie in
                    let seriesUrlBase = "\(self.profil.link)/series/\(self.profil.userName)/\(self.profil.password)/"
                    return Serie(serieStream: serieStream,seriesUrlBase: seriesUrlBase)
                }
                category.series =  serieModels
                completion()
            }
        }
    }
    
    func loadLivesCategories(){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getLiveCategories{categories in
            DispatchQueue.main.async {
                for category in categories {
                    let liveTVCategory = LiveTVCategory(category: category)
                    self.liveTVsCategories.append(liveTVCategory)
                }
                self.loadLives()
            }
        }
    }
    
    func loadLives(){
        
        if self.nbLoadedLivesCategories < liveTVsCategories.count{
            loadLives(for: liveTVsCategories[nbLoadedLivesCategories]) {
                self.nbLoadedLivesCategories += 1
                self.loadLives()
            }
        }
        livesLoaded = true
    }
    
    func loadLives(for category:LiveTVCategory, completion:@escaping ()->()){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getLiveStreams(categoryID: category.id) { liveStreams in
            DispatchQueue.main.async {
                let liveTVModels = liveStreams.map { liveStream in
                    LiveTV(liveStream: liveStream, profil: self.profil)
                }
                category.tvs =  liveTVModels
                completion()
            }
        }
    }
}
