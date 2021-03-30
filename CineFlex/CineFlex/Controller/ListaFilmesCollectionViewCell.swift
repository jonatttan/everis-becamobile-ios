//
//  ListaFilmesCollectionViewCell.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 27/03/21.
//

import UIKit

class ListaFilmesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variáveis
    
    let url = "https://www.themoviedb.org/t/p/w440_and_h660_face"
    let url2 = "https://image.tmdb.org/t/p/w500" // Conferir a mais performática e criar um path no Info.plist
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageCapa: UIImageView!
   
    
    //MARK: - Funções
    
    func formatCelula(_ filme:Filme){

        let urlImage = (url+filme.capa)
        RequestImage().setImage(urlImage) { (img) in
            self.imageCapa.image = img
        }
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 10
    }
}
