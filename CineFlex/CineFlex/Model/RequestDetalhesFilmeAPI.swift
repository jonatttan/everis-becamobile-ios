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
        let objDefault = Detalhes(id: 001, overview: "Sem detalhes disponíveis no momento, tente novamente mais tarde.", poster_path: "", title: "", vote_average: 0.0)
        return objDefault
    }
    
    func obtemDetalhes(_ codigoFilme: Int, completion: @escaping(Detalhes) -> Void) {
        
        let urlCompleta = url+String(codigoFilme)+key
        var detalhesFilme = Detalhes(id: codigoFilme, overview: "Sem detalhes no momento, tente novamente mais tarde.", poster_path: "/nopic.jpg", title: "Obra de código \(codigoFilme)", vote_average: 0.0)
        
        Alamofire.request(urlCompleta, method: .get).responseJSON { (response) in
            switch response.result {
            
            case .success:
                guard let dados = response.data else { return }
                do{
                    detalhesFilme = try JSONDecoder().decode(Detalhes.self, from: dados)
                    completion(detalhesFilme)
                } catch {
                    print("Erro na conversao.")
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
