//
//  XtreamAgent.swift
//  SIPTV
//
//  Created by Dev on 24/08/2022.
//

import Foundation

class XtreamAgent{
    var profil : Profil
    
    init(profil:Profil){
        self.profil = profil
    }
    
    func  set(profil:Profil){
        self.profil = profil
    }
    
    func authenticate(completion:@escaping (Authentication?)->()){
        let url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)"
        
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):

                do {
                       let authentication = try JSONDecoder().decode(Authentication.self,
                                                                  from: data)
                    completion(authentication)

                   } catch {
                       print("decode error")
                       completion(nil)
                   }


            case .failure(let error):
                completion(nil)
                print(error)
            }
        }
    }
   
    func getVodCategories(completion:@escaping ([Category])->()){
        let url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_vod_categories"
        loadCategories(from: url) { categories in
            completion(categories)
        }
    }
    
    func getSeriesCategories(completion:@escaping ([Category])->()){
        let url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_series_categories"
        loadCategories(from: url) { categories in
            completion(categories)
        }
    }
    
    func getLiveCategories(completion:@escaping ([Category])->()){
        let url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_live_categories"
        loadCategories(from: url) { categories in
            completion(categories)
        }
    }
    
    func getLiveStreams(categoryID:String?,completion:@escaping ([LiveStream])->()){
        var url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_live_streams"
        if let categoryID = categoryID {
            url += "&category_id=\(categoryID)"
        }
        
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):
              
                do {
                       let liveStreams = try JSONDecoder().decode([LiveStream].self,
                                                                  from: data)
                    completion(liveStreams)
                       
                   } catch {
                       print("decode error")
                   }
                
               
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getVodStreams(categoryID:String?,completion: @escaping ([MovieStream])->()){
        var url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_vod_streams"
        if let categoryID = categoryID {
            url += "&category_id=\(categoryID)"
        }
        
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):
              
                do {
                       let vodStreams = try JSONDecoder().decode([MovieStream].self,
                                                                  from: data)
                    completion(vodStreams)
                       
                   } catch {
                       print("decode error")
                   }
                
               
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSeriesStreams(categoryID:String?,completion: @escaping ([SeriesStream])->()){
        var url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_series"
        if let categoryID = categoryID {
            url += "&category_id=\(categoryID)"
        }
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):
              
                do {
                       let seriesStreams = try JSONDecoder().decode([SeriesStream].self,
                                                                  from: data)
                    completion(seriesStreams)
                       
                   } catch {
                       print("decode error")
                   }
                
               
            case .failure(let error):
                print(error)
            }
        }
    }
   
    func getVodInfo(vodID:Int,completion: @escaping (VodInfo)->()){
        let url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_vod_info&vod_id=\(vodID)"
        
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):
              
                do {
                       let vodInfo = try JSONDecoder().decode(VodInfo.self,
                                                                  from: data)
                    completion(vodInfo)
                       
                   } catch {
                       print("decode error")
                   }
                
               
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getSeriesInfo(seriesID:Int,completion: @escaping (SerieInfo)->()){
        let url = "\(profil.link)/player_api.php?username=\(profil.userName)&password=\(profil.password)&action=get_series_info&series_id=\(seriesID)"
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):

                do {
                       let seriesStreams = try JSONDecoder().decode(SerieInfo.self,
                                                                  from: data)
                    completion(seriesStreams)

                   } catch {
                       print("decode error")
                   }


            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    private func loadCategories(from url:String, completion:@escaping ([Category])->()){
        loadJson(fromURLString: url) { result in
            switch result{
            case .success(let data):
              
                do {
                       let categories = try JSONDecoder().decode([Category].self,
                                                                  from: data)
                    completion(categories)
                       
                   } catch {
                       print("decode error")
                   }
                
               
            case .failure(let error):
                print(error)
            }
        }
    }
}
