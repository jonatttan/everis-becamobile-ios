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
            
            guard let dados = response.data else { return }
            do {
                let returnData = try JSONDecoder().decode(Filmes.self, from: dados)
                completion(returnData.results)
            } catch {
                print("Erro na decodificação.")
            }
        }
    }

}
