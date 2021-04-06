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
    
    func obtemTendenciasSemana(_ pag:Int, completion: @escaping([Filme]) -> Void){
        let pagina = "&page=\(pag)"
        let url = self.url+self.key+pagina
        
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            print(response)
            
            guard let dados = response.data else { return }
            do {
                let returnData = try JSONDecoder().decode(Filmes.self, from: dados)
                completion(returnData.results)
            } catch {
                print("Erro na decodificação.")
            }

            
//            guard let contaDados = response.data?.count else { return }
//            if (contaDados < 500) {
//                listaFilmes.append(Filme(codigo: 0, titulo: "falha", capa: "erro"))
//                completion(listaFilmes)
//            }
//            if let filme = self.trataResponse(response){
//                listaFilmes = filme
//                completion(listaFilmes)
//            }
        }
    }
    
    //com o uso do Codable, deixo de utilizar as linhas abaixo
    
//    func trataResponse(_ response:DataResponse<Any>) -> [Filme]?{
//
//        var filmes = [Filme]()
//        switch response.result {
//            case .success:
//                if let resposta = response.result.value as? Dictionary<String, Any> {
//
//                    guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>> else { return nil}
//                    for filme in listaDeFilmes {
//
//                        if filme["poster_path"] != nil {
//                            guard let poster = filme["poster_path"] as? String else { return nil }
//                            if filme["id"] != nil {
//                                guard let id = filme["id"] as? Int else { return nil }
//                                if filme["title"] != nil {
//                                    guard let titulo = filme["title"] as? String else { return nil}
//                                    //filmes.append(Filme(codigo: id, titulo: titulo, capa: poster))
//                                }
//                            }
//                        }
//
//                    }
//
//                }
//                break
//            case .failure:
//                //
//                break
//        }
//        return filmes
//
//    }

}
