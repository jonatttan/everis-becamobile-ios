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
        //var detalhesFilme = Detalhes(id: 003, overview: "", posterPath: "", title: "", voteAverage: 0.0)
        
        Alamofire.request(urlCompleta, method: .get).responseJSON { (response) in
            switch response.result {
            
            case .success:
                guard let dados = response.data else { return }
                do{
                    let detalhesFilme = try JSONDecoder().decode(Detalhes.self, from: dados)
                    completion(detalhesFilme)
                    print("So sucesso!")
                } catch {
                    print("Erro na conversao.")
                }
                
                
//                if let dadosFilme = response.result.value as? Dictionary<String, Any> {
//                    guard let titulo = dadosFilme["title"] as? String else {
//                        detalhesFilme = self.def(codigoFilme)
//                        completion(detalhesFilme)
//                        return
//                    }
//                    guard let capa = dadosFilme["poster_path"] as? String else {
//                        detalhesFilme = self.def(codigoFilme)
//                        completion(detalhesFilme)
//                        return
//
//                    }
//                    guard let sinopse = dadosFilme["overview"] as? String else { return }
//                    guard let avaliacao = dadosFilme["vote_average"] as? Double else {
//                        detalhesFilme = self.def(codigoFilme)
//                        completion(detalhesFilme)
//                        return
//                    }
//                    detalhesFilme = Detalhes(titulo: titulo, capa: capa, sinopse: sinopse, avaliacao: avaliacao)
//                    completion(detalhesFilme)
//                }
                
                break
            case .failure:
                print(" ***** Falha no retorno ***** ")
                break
            }
        }
        
    }
    
}
