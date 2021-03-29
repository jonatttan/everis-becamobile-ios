//
//  RequestFilmesAPITests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 29/03/21.
//

import XCTest

struct Filme: Codable {
    let title: String
    let capa: String
}

class RequestFilmesAPITests: XCTestCase {

    override func setUpWithError() throws {
        var filmes = [Filme]()
        
    }
    
    func testeDeveRetornarDadosDeRequisicao() {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
