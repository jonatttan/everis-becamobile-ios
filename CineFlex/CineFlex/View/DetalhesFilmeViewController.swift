//
//  DetalhesFilmeViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 29/03/21.
//

import UIKit
import Alamofire
import AlamofireImage // Temporario, migrar

class DetalhesFilmeViewController: UIViewController {

    
    // MARK: IBOutlets
    
    @IBOutlet weak var imageCapaFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    // MARK: - Variáveis
    
    var filmeSelecionado:Filme? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carregaTela()
    }
    
    
    func carregaTela() {
        
        if let codigo = filmeSelecionado?.codigo {
            RequestDetalhesFilmeAPI().obtemDetalhes(codigo) { (filmeDetalhes) in
                print("ola")
                self.labelTitulo.text = filmeDetalhes.titulo
                self.labelSinopse.text = "Sinopse: \(filmeDetalhes.sinopse)"
                self.labelRating.text = "Avaliação: \(filmeDetalhes.avaliacao)"
                
                
                print("================================================================\(filmeDetalhes)")
                
                let urlImage = ("https://image.tmdb.org/t/p/w500\(filmeDetalhes.capa)")
                RequestImage().setImage(urlImage) { (img) in
                    self.imageCapaFilme.image = img
                }
                
                
            }
            print("Codigo================================================================\(codigo)")
        }
        else {
            print("Sem sucesso no carregamento dos dados do filme selecionado.")
        }
    }
    
}
