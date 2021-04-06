//
//  Filme.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 31/03/21.
//

import UIKit

struct Filmes: Codable {
    let results: [Filme]
}

struct Filme: Codable {
    let id: Int
    let poster_path: String
    let title: String?
}
