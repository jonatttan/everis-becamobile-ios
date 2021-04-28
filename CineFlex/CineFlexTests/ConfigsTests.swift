//
//  ConfigsTests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 28/04/21.
//

import XCTest
@testable import CineFlex

class ConfigsTests: XCTestCase {
    
    var configs: Configs!
    var result: Bool!
    override func setUp() {
        configs = Configs()
    }

    override func tearDown() {
        result = nil
    }
    func testDeveRetornarDadoComMaisDe20CaracteresEDeveSerIgualAoEsperado() {
        result = false
        guard let dadoRetorno = configs.urlDetalhes() else { return }
        if dadoRetorno.count > 20 {
            result = true
        }
        XCTAssertTrue(result, "Não retornado url esperada para chamada de API.")
        XCTAssertEqual("https://api.themoviedb.org/3/movie/", dadoRetorno, "A url retornada não condiz com a esperada.")
    }

}
