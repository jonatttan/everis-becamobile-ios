//
//  RequestDetalhesFilmeAPITests.swift
//  CineFlexUITests
//
//  Created by Jonattan Moises Sousa on 31/03/21.
//

import XCTest
@testable import CineFlex

class RequestDetalhesFilmeAPITests: XCTestCase {
    var bdDetalhes: [[Any]] = [[]]
    var detalhesFilme: [Detalhes]?
    var verificador = false
    
    
    override func setUpWithError() throws {
        
        bdDetalhes = [["A volta dos que não foram", "/imagem.jpg", "Um caminho só de ida", 4.5], ["A trança da Mulher careca", "/imagemTranca.jpg", "Sem nós", 6.8], ["Fight 2 carecas, 1 pente", "/imagem.jpg", "Sem dentes e de ferro", 7.4], ["A vida de uma formiga", "/imagemFormigasLife.jpg", "Sem fim, incansáveis", 8.2]]
    }
    
    override func tearDownWithError() throws {
    }
    
    func testeTodosOsFilmesDevemPossuirTitulo() {
        for filme in self.bdDetalhes {
            
            if let title = filme[0] as? String {
                if (!(title.isEmpty)) {
                    guard let img = filme[1] as? String else { return }
                    guard let  resumo = filme[2] as? String else { return }
                    guard let nota = filme[3] as? Double else { return }
                    self.detalhesFilme?.append(Detalhes(titulo: title, capa: img, sinopse: resumo, avaliacao: nota))
                } else {
                    self.verificador = true
                }
            }
        }
        
        XCTAssertFalse(self.verificador)
    }
    
    func testeTodosOsFilmesDevemConterTodosOsCamposPreenchidos() {
        verificador = true
        
        for filme in self.bdDetalhes {
            guard let title = filme[0] as? String else { return }
            if (!(title.isEmpty)) {
                guard let img = filme[1] as? String else { return }
                if (!(img.isEmpty)) {
                    guard let  resumo = filme[2] as? String else { return }
                    if (!(resumo.isEmpty)) {
                        guard let nota = filme[3] as? Double else { return }
                        if ((nota != 0.0)) {
                            self.detalhesFilme?.append(Detalhes(titulo: title, capa: img, sinopse: resumo, avaliacao: nota))
                        } else { self.verificador = false}
                    } else { self.verificador = false}
                } else { self.verificador = false}
            } else { self.verificador = false}
        }
        
        XCTAssertTrue(verificador)
    }
    
}
