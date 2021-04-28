//
//  DetalhesFilmeViewControllerTests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 28/04/21.
//

import XCTest
@testable import CineFlex

class DetalhesFilmeViewControllerTests: XCTestCase {
    var filme: Filme!
    var detalhesFVC: DetalhesFilmeViewController!
    var result: Bool!
    override func setUp() {
        detalhesFVC = DetalhesFilmeViewController()
        filme = Filme(codigo: 031, titulo: "cacadaFinal", capa: "CapaTeste")
    }
    override func tearDown() {
        result = nil
    }
    func testDeveInicializarFuncoes() {
        detalhesFVC.viewDidLoad()
        detalhesFVC.filmeSelecionado = filme
        detalhesFVC.carregaTela()
        
    }
}
