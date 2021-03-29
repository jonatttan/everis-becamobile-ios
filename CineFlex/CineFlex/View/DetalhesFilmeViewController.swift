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
                self.labelTitulo.text = filmeDetalhes.titulo
                self.labelSinopse.text = "Sinopse: \(filmeDetalhes.sinopse)"
                self.labelRating.text = "Avaliação: \(filmeDetalhes.avaliacao)"
                
                
                let urlImage = "https://www.themoviedb.org/t/p/w440_and_h660_face\(filmeDetalhes.capa)"
                Alamofire.request(urlImage).responseImage { response in
                    if case .success(let image) = response.result {
                        let imageFormated = image.af_imageRounded(withCornerRadius: 10)
                        self.imageCapaFilme.image = imageFormated
                    }
                }
                
            }
        }
        else {
            print("Sem sucesso no carregamento dos dados do filme selecionado.")
        }
    }

}
