//
//  MoviesClient.swift
//  TopMovies
//
//  Created by camilo andres ibarra yepes on 9/12/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    func fetchMovies(completion: @escaping (_ movies: [NSDictionary]) -> ()) {
        //fetch data
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let session = URLSession.shared
        let url = URL(string: urlString)!
        let task = session.dataTask(with: url) { (data, response, err) in
            if data != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
                    //print(json?.value(forKeyPath: "feed.entry") as! [NSDictionary])
                    if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary]{
                        completion(movies)
                        return
                    }
                    
                } catch {
                    print("Could not serialise")
                }
            }
        }
        task.resume()
        
    }
}
