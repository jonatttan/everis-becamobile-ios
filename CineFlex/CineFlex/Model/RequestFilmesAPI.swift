//
//  RequestFilmesAPI.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 28/03/21.
//

import UIKit
import Alamofire

class RequestFilmesAPI: NSObject {
    
//
    
    func trataResponse(_ response:DataResponse<Any>) -> [Filme]?{
        var filmes = [Filme]()
        
        switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>> else { return nil}
                    for filme in listaDeFilmes {

                        if filme["title"] != nil {
                            guard let obra = filme["title"] as? String else { return nil }
                            if filme["poster_path"] != nil {
                                guard let poster = filme["poster_path"] as? String else { return nil }
                                filmes.append(Filme(title: obra, capa: poster))
                            }
                            print("=======")
                        }

                    }
                    print("Certo, total de filmes: \(filmes.count)")
                }
                break
           case .failure:
               break
        }
        return filmes
    }
    
//    func requestApiAlamofire(_ urlApi:String) -> [Filme]{
//        var filmesLista = [Filme]()
//        Alamofire.request(urlApi, method: .get).responseJSON { (response) in
//            switch response.result {
//                case .success:
//                    if let resposta = response.result.value as? Dictionary<String, Any> {
//                        // SEPARAR em função.
//                        guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>> else { return }
//                        //var contaFilmes = 0
//                        for filme in listaDeFilmes {
//
//                            if filme["title"] != nil {
//                                guard let obra = filme["title"] as? String else { return }
//                                print(obra)
//                                if filme["poster_path"] != nil {
//                                    guard let poster = filme["poster_path"] as? String else { return }
//                                    print(poster)
//                                    filmesLista.append(Filme(title: obra, capa: poster))
//                                }
//                                print("=======")
//                            }
//                        }
//                        print("Total de filmes: \(filmesLista.count)")
//                    }
//                    break
//               case .failure:
//                   print("Falha")
//                   break
//            }
//
//        }
//        return filmesLista
//    }

}
