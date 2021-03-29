//
//  RequestDetalhesFilmeAPI.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 29/03/21.
//

import UIKit
import Alamofire

class RequestDetalhesFilmeAPI: NSObject {
    
    let pagina = "https://api.themoviedb.org/3/movie/"
    let apiKey = "?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR"
    
    
    public func obtemDetalhes(_ codigoFilme: String, completion: @escaping(Detalhes) -> Void) {
//    func obtemDetalhes(codigoFilme:String) -> Detalhes? {
        let urlCompleta = pagina+codigoFilme+apiKey
//        let urlCompleta = "\(pagina)527774\(apiKey)"
        var detalhesFilme = Detalhes(titulo: "", capa: "", sinopse: "", avaliacao: 0)
        
        Alamofire.request(urlCompleta, method: .get).responseJSON { (response) in
            switch response.result {
            
            case .success:
                if let dadosFilme = response.result.value as? Dictionary<String, Any> {
                    guard let titulo = dadosFilme["title"] as? String else { return }
                    guard let capa = dadosFilme["poster_path"] as? String else { return }
                    guard let avaliacao = dadosFilme["vote_average"] as? Double else { return }
                    guard let sinopse = dadosFilme["overview"] as? String else { return }
//                    print("Titulo: \(titulo)")
//                    print("Capa: \(capa)")
//                    print("Avaliação \(avaliacao)")
//                    print("Sinopse: \(sinopse)")
                    detalhesFilme = Detalhes(titulo: titulo, capa: capa, sinopse: sinopse, avaliacao: avaliacao)
                    completion(detalhesFilme)
                }
                
                break
            case .failure:
                break
            
            }
        }
        
        //return detalhesFilme
        //completion(detalhesFilme)
    }
}
