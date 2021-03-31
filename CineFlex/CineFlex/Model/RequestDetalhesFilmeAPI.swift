//
//  RequestDetalhesFilmeAPI.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 29/03/21.
//

import UIKit
import Alamofire

class RequestDetalhesFilmeAPI: NSObject {
    
    //MARK: - Variáveis
    
    lazy var url: String = {
        guard let key = Configs().urlDetalhes() else { return "" }
        return key
    }()
    
    lazy var key: String = {
        guard let key = Configs().apiKey() else { return "" }
        return key
    }()
    
    //MARK: - Funções
    
    func def(_ codigoFilme: Int) -> Detalhes{
        let objDefault = Detalhes(titulo: "Obra de código \(codigoFilme)", capa: "", sinopse: "Sem detalhes disponíveis no momento, tente novamente mais tarde.", avaliacao: 0)
        return objDefault
    }
    
    func obtemDetalhes(_ codigoFilme: Int, completion: @escaping(Detalhes) -> Void) {
        
        let urlCompleta = url+String(codigoFilme)+key
        var detalhesFilme = Detalhes(titulo: "", capa: "", sinopse: "", avaliacao: 0)
        
        Alamofire.request(urlCompleta, method: .get).responseJSON { (response) in
            switch response.result {
            
            case .success:
                if let dadosFilme = response.result.value as? Dictionary<String, Any> {
                    guard let titulo = dadosFilme["title"] as? String else {
                        detalhesFilme = self.def(codigoFilme)
                        completion(detalhesFilme)
                        return
                    }
                    guard let capa = dadosFilme["poster_path"] as? String else {
                        detalhesFilme = self.def(codigoFilme)
                        completion(detalhesFilme)
                        return
                        
                    }
                    guard let sinopse = dadosFilme["overview"] as? String else { return }
                    guard let avaliacao = dadosFilme["vote_average"] as? Double else {
                        detalhesFilme = self.def(codigoFilme)
                        completion(detalhesFilme)
                        return
                    }
                    detalhesFilme = Detalhes(titulo: titulo, capa: capa, sinopse: sinopse, avaliacao: avaliacao)
                    completion(detalhesFilme)
                }
                
                break
            case .failure:
                print(" ***** Falha no retorno ***** ")
                break
            }
        }
        
    }
    
}
