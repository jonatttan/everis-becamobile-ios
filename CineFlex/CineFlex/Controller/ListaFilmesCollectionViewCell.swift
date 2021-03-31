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

        RequestImage().setImage(filme.capa) { (img) in
            self.imageCapa.image = img
        }
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 10
    }
}
