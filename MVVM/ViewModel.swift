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
    
    var movies : [NoticiaModel]?
    
    var arrayObject : [NoticiaModel] = []

    
    func fetchMovies(completion:@escaping () -> ()) {
        moviesClient.fetchMovies { movies in
        
            self.movies = movies
            print(movies!)
            completion()
        
        }
    
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
    
        return movies?.count ?? 0
        //return movies?.count ?? 0
    
    }
    
    func titleForItemAtIndexPath(indexPath: IndexPath) -> [NoticiaModel] {

        let datosCelda = movies?[indexPath.row]
        var arr = [NoticiaModel]()
        
        arr.append(NoticiaModel(titulo: datosCelda?.titulo ?? "", fecha: datosCelda?.fecha ?? ""))
        print(arr[0])
        return movies!
        //return movies?[indexPath.row].value(forKeyPath: "autor") as? String ?? ""
    }

}
