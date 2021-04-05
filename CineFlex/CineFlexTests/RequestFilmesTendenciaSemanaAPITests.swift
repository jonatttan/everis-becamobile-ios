//
//  RequestFilmesTendenciaSemanaAPITests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 31/03/21.
//

import XCTest
@testable import CineFlex

class RequestFilmesTendenciaSemanaAPITests: XCTestCase {
    
    var listaDeFilmesTendencia:[Filme] = []
    var quantidadeDeFilmes = 0
    var bdFilmes:[[Any]] = [[]]
    
    override func setUpWithError() throws {
        bdFilmes = [["foto.jpg", 098883, "Vidas Secas"], ["/capaFilme34.png", 098834, "Chamas da vingança"],["/capaFilme4.jpeg", 098898, "Livro de Eli"],["/capaFilme67.jpg", 098803, "Sem perdão"],["/capaFilme19.png", 098841, "Incondicional"],["/capaFilme4445.png", 098559, "Só de mãe"]]
        
        for filme in self.bdFilmes {
            guard let capaSelect = filme[0] as? String else { return }
            guard let codSelect = filme[1] as? Int else { return }
            guard let tituloSelect = filme[2] as? String else { return }
        
            if (true){
                self.listaDeFilmesTendencia.append(Filme(codigo: codSelect, titulo: tituloSelect, capa: capaSelect))
            }
        }
        

    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testeNaoDeveEncontrarCapaInvalidaEmListaDeFilmes() {
        var filmeSemCapa = 0
        listaDeFilmesTendencia = []
        for filme in self.bdFilmes {
            guard let capaSelect = filme[0] as? String else { return }
            guard let codSelect = filme[1] as? Int else { return }
            guard let tituloSelect = filme[2] as? String else { return }
        
            if ((capaSelect.count < 5) || ((!capaSelect.contains(".jpg")) && (!capaSelect.contains(".png")) && (!capaSelect.contains(".jpeg")))){
                filmeSemCapa = filmeSemCapa + 1
            } else {
                self.listaDeFilmesTendencia.append(Filme(codigo: codSelect, titulo: tituloSelect, capa: capaSelect))
            }
        }
        
        XCTAssertEqual(0, filmeSemCapa)
    }
    
    func testeRetornoDeveConterQuantidadeDeFilmesDiferenteZero(){
        var semFilmes = true
        
        if (self.listaDeFilmesTendencia.count > 0) {
            semFilmes = false
        }
        
        XCTAssertFalse(semFilmes)
    }
}
