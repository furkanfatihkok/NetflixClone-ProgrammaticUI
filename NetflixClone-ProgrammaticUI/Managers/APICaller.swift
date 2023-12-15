//
//  APICaller.swift
//  NetflixClone-ProgrammaticUI
//
//  Created by FFK on 14.12.2023.
//

import Foundation

class Constants {
    
    static let API_KEY = "93d8ae2569809582039236954c25b55c"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all//day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data,error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                print(results)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
