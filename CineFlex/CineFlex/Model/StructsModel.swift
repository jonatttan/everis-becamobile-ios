//
//  StructsModel.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 28/03/21.
//

import UIKit

//MARK: - Codables
struct Filme: Codable {
    let capa: String
    let codigo: Int
}

struct Detalhes: Codable {
    let titulo, capa, sinopse: String
    let avaliacao: Double
}

class StructsModel: NSObject {
}
