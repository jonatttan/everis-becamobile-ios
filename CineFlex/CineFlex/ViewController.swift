//
//  ViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 26/03/21.
//

import UIKit
import Alamofire

//MARK: - Codables
struct Filme: Codable {
    let title: String
    let capa: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    //MARK: - Variáveis
    let urlApi = "https://api.themoviedb.org/3/trending/all/week?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR"
    var filmes = [Filme]()
    var contador = 0
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var labelContaFilmes: UILabel!
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestApiAlamofire()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
    }
    
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! ListaFilmesCollectionViewCell
        
        let filmeAtual = filmes[indexPath.item]
        celulaFilme.formatCelula(filmeAtual)
        
        return celulaFilme
    }
    
    
    //MARK: - Funções

    func requestApiAlamofire(){
        Alamofire.request(self.urlApi, method: .get).responseJSON { (response) in
            if let filme = RequestFilmesAPI().trataResponse(response){
                self.filmes = filme
                self.labelContaFilmes.text = String(filme.count)
                self.colecaoFilmes.reloadData()
            }
        }
        
    }
}
        
        
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
//                                    filmesLista.append(Filme(title: obra, capa: poster)) //Extrair para função
//                                    self.contador = self.contador + 1
//                                }
//                                print("=======")
//                            }
//                        }
//                        print("Total de filmes: \(self.filmes.count)")
//                        //Fim SEPARAR em função
//                        //self.labelContaFilmes.text = "\(self.filmes.count) filmes encontrados" // Implementar no retorno?
//                    }
//                    break
//               case .failure:
//                   print("Falha")
//                   break
//            }
//
//        }
        //self.configura()


// Tendencias https://api.themoviedb.org/3/trending/all/week?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR

// Detalhes https://api.themoviedb.org/3/movie/464052?api_key=4925d4618168b98d05746090da7c9fae

