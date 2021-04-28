//
//  DetalhesTests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 28/04/21.
//

import XCTest
@testable import CineFlex

class DetalhesTests: XCTestCase {

    var detalhes: Detalhes!
    var result: Bool!
    override func setUp() {
        detalhes = Detalhes(titulo: "TesteFilme", capa: "testeCapa", sinopse: "testeSinopse", avaliacao: 4.5)
    }
    override func tearDown() {
        result = nil
    }
    func testDeveRetornarValoresInseridosAnteriormente() {
        result = false
        result = detalhes.titulo.isEmpty ? true : false
        XCTAssertFalse(result, "O campo TITULO não está sendo gravado na inicialização.")
        result = detalhes.capa.isEmpty ? true : false
        XCTAssertFalse(result, "O campo CAPA não está sendo gravado na inicialização.")
        result = detalhes.sinopse.isEmpty ? true : false
        XCTAssertFalse(result, "O campo SINOPSE não está sendo gravado na inicialização.")
        result = detalhes.avaliacao.isZero ? true : false
        XCTAssertFalse(result, "O campo AVALIAÇÃO não está sendo gravado na inicialização, seu valor deve ser maior que 0.0.")
    }
    func testSeValoresRetornadosSaoIguaisAosSetados() {
        XCTAssertEqual("TesteFilme", detalhes.titulo, "Titulo retornado é diferente do setado na inicialização.")
        XCTAssertEqual("testeCapa", detalhes.capa, "Capa retornada é diferente do setado na inicialização.")
        XCTAssertEqual("testeSinopse", detalhes.sinopse, "Sinopse retornada é diferente do setado na inicialização.")
        XCTAssertEqual(4.5, detalhes.avaliacao, "Valor de avaliação retornado é diferente do setado na inicialização.")
    }
}

