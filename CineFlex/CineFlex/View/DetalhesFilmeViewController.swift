//
//  DetalhesFilmeViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 29/03/21.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {

    
    // MARK: IBOutlets
    
    @IBOutlet weak var imageCapaFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    // MARK: - Variáveis
    
    var filmeSelecionado:Filme? = nil
    
    //MARK: - Funções
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carregaTela()
    }
    
    
    func carregaTela() {
        
        if let codigo = filmeSelecionado?.id {
            RequestDetalhesFilmeAPI().obtemDetalhes(codigo) { (filmeDetalhes) in
                
                self.labelTitulo.text = filmeDetalhes.title
                self.labelSinopse.text = "Sinopse: \(filmeDetalhes.overview)"
                self.labelRating.text = "Avaliação: \(filmeDetalhes.vote_average)"
                
                RequestImage().setImage(filmeDetalhes.poster_path) { (img) in
                    self.imageCapaFilme.image = img
                }
                
            }
        }
        else {
            print("Sem sucesso no carregamento dos dados do filme selecionado.")
        }
    }
    
}
