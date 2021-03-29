//
//  ListaFilmesCollectionViewCell.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 27/03/21.
//

import UIKit

class ListaFilmesCollectionViewCell: UICollectionViewCell {
    
    let url = "https://www.themoviedb.org/t/p/w440_and_h660_face/"
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageCapa: UIImageView!
    
    func formatCelula(_ filme:Filme){
        guard let urlImagem = URL(string: url+filme.capa) else { return }
        load(urlImagem)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
}


extension ListaFilmesCollectionViewCell{
    func load(_ url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageCapa.image = image
                    }
                }
            }
        }
    }
}
