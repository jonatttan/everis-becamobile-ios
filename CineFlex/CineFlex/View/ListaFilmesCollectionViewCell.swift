//
//  ListaFilmesCollectionViewCell.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 27/03/21.
//

import UIKit

class ListaFilmesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var labelNome: UILabel!
    
    func formatCelula(_ filme:Filme){
        
        labelNome.text = filme.title
    }

}
