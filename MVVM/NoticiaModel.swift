//
//  NoticiaModel.swift
//  MVVM
//
//  Created by Dragon on 30/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class NoticiaModel: NSObject {
    
    var titulo : String
    var fecha : String
    
    init(titulo: String, fecha:String) {
        self.titulo = titulo
        self.fecha = fecha
    }

}
