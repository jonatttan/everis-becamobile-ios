//
//  ListaFilmesCollectionViewCell.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 27/03/21.
//

import UIKit

class ListaFilmesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageCapa: UIImageView!
   
    
    //MARK: - Funções
    
    func formatCelula(_ filme:Filme){

        RequestImage().setImage(filme.poster_path) { (img) in
            self.imageCapa.image = img
        }
        self.layer.cornerRadius = 10
    }
}
