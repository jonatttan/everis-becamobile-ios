//
//  Detalhes.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 31/03/21.
//

import UIKit

class Detalhes: NSObject {
    let titulo, capa, sinopse: String
    let avaliacao: Double
    
    
    //MARK: - Construtor
    
    init (titulo: String, capa: String, sinopse: String, avaliacao: Double){
        self.titulo = titulo
        self.capa = capa
        self.sinopse = sinopse
        self.avaliacao = avaliacao
    }
}
