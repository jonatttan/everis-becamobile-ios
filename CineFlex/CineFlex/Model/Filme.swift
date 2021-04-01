//
//  Filme.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 31/03/21.
//

import UIKit

class Filme: NSObject {
    let codigo: Int
    @objc let titulo: String
    let capa: String
    
    init(codigo: Int, titulo: String, capa: String) {
        self.codigo = codigo
        self.titulo = titulo
        self.capa = capa
    }
}
