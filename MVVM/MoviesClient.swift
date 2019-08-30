//
//  MoviesClient.swift
//  MVVM
//
//  Created by Dragon on 25/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    
    func fetchMovies(completion: @escaping ([NSDictionary]?) -> Void) {
        
        let urlStr = "http://movil.aztecanoticias.com.mx/ultimas/ultnot.json"
        let urlApple = URL(string:urlStr)
        let task = URLSession.shared.dataTask(with: urlApple!) {(data, response, error) in
            
            if error != nil {
                print("ERROR URL OR INTERNET CONECTION")
                print(error!)
                
            } else{
                
                do{
                    let rootJSONDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    //if let items = rootJSONDictionary["items"] as? [[String: Any]]{

                    if let movies = rootJSONDictionary["items"] as? [NSDictionary]{
                        
                        print(movies)
                        completion(movies)
                        
                    }// end if
                    
                }// end do
                catch{
                    
                    print("Error Catch")
                    
                    completion(nil)
                    
                    return
                    
                } //end catch
            } // end else
        }// end let task data, response, error
        task.resume()
    }

}
