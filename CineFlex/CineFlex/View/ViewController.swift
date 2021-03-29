//
//  ViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 26/03/21.
//

import UIKit
import Alamofire



class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    //MARK: - Variáveis
    let urlApi = "https://api.themoviedb.org/3/trending/all/week?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR"
    var filmes = [Filme]()
    var contador = 0
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var labelContaFilmes: UILabel!
    @IBOutlet weak var colecaoFilmes: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.requestApiAlamofire()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        //teste chamada detalhes
//        RequestDetalhesFilmeAPI().obtemDetalhes("791373") { (detalhesFilme) in
//            print("Segue detalhes do filme: ------ \(detalhesFilme)")
//        }
        teste()
    }

    
    //MARK: - Funções
    
    func teste(){
        RequestFilmesTendenciaSemanaAPI().obtemTendenciasSemana(urlApi) { (listaFilmess) in
            self.filmes = listaFilmess
            let contador = self.filmes.count
            self.labelContaFilmes.text = (contador < 2 && contador >= 0) ? "\(contador) filme encontrado" : "\(contador) filmes encontrados"
            self.colecaoFilmes.reloadData()
            
            for filme in self.filmes {
                
                RequestDetalhesFilmeAPI().obtemDetalhes(filme.codigo) { (detalhesFilme) in
                }
            }
        }
    }
    
}
        

//MARK: - Extensions

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell: CGFloat
        
        widthCell = (collectionView.bounds.width / 2) - 10
        return CGSize(width: widthCell, height: widthCell+80)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeEscolhido = filmes[indexPath.item]
        
        _ = UIStoryboard(name: "Main", bundle: nil)
        let controlador = storyboard?.instantiateViewController(withIdentifier: "filmeDetalhes") as! DetalhesFilmeViewController
        controlador.filmeSelecionado = filmeEscolhido
        print(filmeEscolhido)
        self.navigationController?.pushViewController(controlador, animated: true)
        
    }

}

// Tendencias https://api.themoviedb.org/3/trending/all/week?api_key=4925d4618168b98d05746090da7c9fae&language=pt-BR

// Detalhes https://api.themoviedb.org/3/movie/464052?api_key=4925d4618168b98d05746090da7c9fae

