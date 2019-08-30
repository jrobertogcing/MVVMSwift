//
//  ViewModel.swift
//  MVVM
//
//  Created by Dragon on 25/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var moviesClient: MoviesClient!
    
    var movies : [NSDictionary]?
    
    func fetchMovies(completion:@escaping () -> ()) {
        moviesClient.fetchMovies { movies in
        
            self.movies = movies
            print(movies!)
            completion()
        
        }
    
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
    
        //return 10
        return movies?.count ?? 0
    
    }
    
    func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
        //return "Hi"
        
        return movies?[indexPath.row].value(forKeyPath: "autor") as? String ?? ""
    }

}
