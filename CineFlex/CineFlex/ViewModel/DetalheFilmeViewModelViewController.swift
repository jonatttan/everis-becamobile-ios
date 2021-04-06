//
//  DetalhesFilmesViewModelViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 05/04/21.
//

import Foundation
import UIKit

class DetalheFilmeViewModelViewController: UIViewController {
    
    
    //MARK: Variables
    var filmeDetalhe:Detalhes?
    var filmeSelecionado:Filme? = nil
    
    
    //MARK: IBOutlets
    @IBOutlet weak var imagePosterFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelPontuacao: UILabel!
    
    override func viewDidLoad() {
        self.findDetalhes()
    }
    
    func findDetalhes() {
//        let codigo = Double.random(in: 0000...9999)
//        let tituloFilme = "Mulher-Maravilha"
//        let capaFilme = "/egg7KFi18TSQc1s24RMmR9i2zO6.jpg"
//        let sinopseFilme = "Em 1984, Diana Prince entra em conflito com dois inimigos formidáveis, Maxwell Lord e a Mulher-Leopardo, enquanto reencontra misteriosamente com seu antigo interesse amoroso Steve Trevor."
//        let avaliacaoFilme = 6.8
//        filmeDetalhe = Detalhes(id: codigo, overview: sinopseFilme, posterPath: capaFilme, title: tituloFilme, voteAverage: avaliacaoFilme)
//        self.presenter()
        
        if let codigo = filmeSelecionado?.id {
            RequestDetalhesFilmeAPI().obtemDetalhes(codigo) { (detalhe) in
                //setupUI(detalhe)
                self.filmeDetalhe = detalhe
                self.presenter()
            }
        }

    }
    
    
    func setupUI() {
    
    }
    
    
    

    
    
    func presenter() {
        guard let capaShow = filmeDetalhe?.poster_path else { return }
        guard let tituloShow = filmeDetalhe?.title else { return }
        guard let sinopseShow = filmeDetalhe?.overview else { return }
        guard let pontuacaoShow = filmeDetalhe?.vote_average else { return }
        
        RequestImage().setImage(capaShow) { (img) in
            self.imagePosterFilme.image = img
        }
        self.labelTitulo.text = tituloShow
        self.labelSinopse.text = sinopseShow
        self.labelPontuacao.text = String(pontuacaoShow)
    }
}
