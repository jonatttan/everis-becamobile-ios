//
//  ViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 26/03/21.
//

import UIKit
import Alamofire
import Foundation

struct Filme: Codable {
    let title: String?
    let posterPath: String?
}

struct Filmes: Codable {
    var results:[Filme]
}

class ViewController: UIViewController {
//
//    var formatJson:Dictionary<String, Any> = [:]
//    var listaDeFilmes:Array<Dictionary<String, Any>> = []
//    var filmesListados = [Filme] ()
//
    
    let urlApi = "https://api.themoviedb.org/3/trending/all/week?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestApiAlamofire()
    }

    
    func requestApiAlamofire() {
        Alamofire.request(urlApi, method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    if let resposta = response.result.value as? Dictionary<String, Any> {
                        // SEPARAR em função.
                        guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>> else { return }
                        var contaFilmes = 0
                        for filme in listaDeFilmes {
                            if filme["title"] != nil {
                                guard let obra = filme["title"] else { return }
                                print("=======")
                                print(obra)
                                if filme["poster_path"] != nil {
                                    guard let poster = filme["poster_path"] else { return }
                                    print(poster)
                                }
                                print("=======")
                            }
                            contaFilmes = contaFilmes + 1
                        }
                        print("Total de filmes: \(contaFilmes)")
                        //Fim SEPARAR em função

                    }
                    break
               case .failure:
                   print("Falha")
                   break
            }

        }
    }
}

// Tendencias https://api.themoviedb.org/3/trending/all/week?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR

// Detalhes https://api.themoviedb.org/3/movie/464052?api_key=4925d4618168b98d05746090da7c9fae
