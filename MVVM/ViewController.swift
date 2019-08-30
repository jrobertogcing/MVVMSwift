//
//  ViewController.swift
//  MVVM
//
//  Created by Dragon on 23/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var informationTableView: UITableView!
    
    var arr = [String]()
    
    @IBOutlet var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.informationTableView.delegate = self
        self.informationTableView.dataSource = self

        
        viewModel.fetchMovies {
            
            DispatchQueue.main.async {
                self.informationTableView.reloadData()
            }


        }
        
        arr = ["gato", "perro", "rino", "tortuga"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return arr.count
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = informationTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        //ell.textLabel?.text = arr[indexPath.row]
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell:UITableViewCell, forRowAtIndexPath indexPath:IndexPath){
    
        //cell.textLabel?.text = "Hola"
        //cell.textLabel?.text = viewModel.titleForItemAtIndexPath(indexPath: indexPath)
        var arr = [NoticiaModel]()
        arr = viewModel.titleForItemAtIndexPath(indexPath: indexPath)
        let datosCelda = arr[indexPath.row]
        cell.textLabel?.text = datosCelda.titulo
    }
}

