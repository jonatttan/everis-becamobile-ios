//
//  CineFlexTests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 26/03/21.
//

import XCTest
@testable import CineFlex

class CineFlexTests: XCTestCase {
    
    var listaDeFilmesTendencia:[Filme] = []
    var quantidadeDeFilmes = 0
    var bdFilmes:[[Any]] = [[]]
//    var bdDetalhes:[[Any]] = [[]] //Parte de testes detalhes
    
    override func setUpWithError() throws {
//        bdFilmes2 = [["A volta dos que não foram", 4.5], ["A trança da Mulher careca", 6.8], ["Fight 2 carecas, 1 pente", 7.4], ["A vida de uma formiga", 8.3], ["Sem fim", 8.2]] //Parte de testes detalhes
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
