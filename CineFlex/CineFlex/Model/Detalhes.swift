//
//  Detalhes.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 31/03/21.
//

import UIKit


struct Detalhes: Codable{
    let id: Int
    let originalTitle, overview: String
    let posterPath: String
    let title: String
    let voteAverage: Double
}

//
//class Detalhes: NSObject {
//    let titulo, capa, sinopse: String
//    let avaliacao: Double
//    
//    
//    //MARK: - Construtor
//    
//    init (titulo: String, capa: String, sinopse: String, avaliacao: Double){
//        self.titulo = titulo
//        self.capa = capa
//        self.sinopse = sinopse
//        self.avaliacao = avaliacao
//    }
//}
