//
//  ViewModel.swift
//  TopMovies
//
//  Created by camilo andres ibarra yepes on 9/12/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var moviesClient: MoviesClient!
    var movies: [NSDictionary]?
    
    func fetchMovies(completion: @escaping () -> ()){
        moviesClient.fetchMovies { movies in
            self.movies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int{
        return movies?.count ?? 0
    }
    
    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return movies?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
}
