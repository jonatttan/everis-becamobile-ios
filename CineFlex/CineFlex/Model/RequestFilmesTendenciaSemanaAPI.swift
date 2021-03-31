//
//  RequestFilmesTendenciaSemanaAPI.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 29/03/21.
//

import UIKit
import Alamofire

class RequestFilmesTendenciaSemanaAPI: NSObject {
    
    //MARK: - Variáveis
    
    lazy var url:String = {
        guard let url = Configs().urlTendencias() else { return ""}
        return url
    }()
    
    lazy var key: String = {
        guard let key = Configs().apiKey() else { return "" }
        return key
    }()
    
    
    //MARK: - Funções
    
    func obtemTendenciasSemana(completion: @escaping([Filme]) -> Void){
        let url = self.url+self.key
        var listaFilmes = [Filme]()
        Alamofire.request(url, method: .get).responseJSON { (response) in
            guard let contaDados = response.data?.count else { return }
            if (contaDados < 500) {
                listaFilmes.append(Filme(capa: "erro", codigo: 0))
                completion(listaFilmes)
            }
            if let filme = self.trataResponse(response){
                listaFilmes = filme
                completion(listaFilmes)
            }
        }
    }
    
    func trataResponse(_ response:DataResponse<Any>) -> [Filme]?{
        
        var filmes = [Filme]()
        switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>> else { return nil}
                    for filme in listaDeFilmes {
                        if filme["poster_path"] != nil {
                            guard let poster = filme["poster_path"] as? String else { return nil }
                            if filme["id"] != nil {
                                guard let id = filme["id"] as? Int else { return nil }
                                filmes.append(Filme(capa: poster, codigo: id))
                            }
                        }
                        
                    }
                }
                break
            case .failure:
            
                break
        }
        return filmes
        
    }

}
