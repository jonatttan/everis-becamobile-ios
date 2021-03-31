//
//  RequestImage.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 30/03/21.
//

import UIKit
import Alamofire
import AlamofireImage

class RequestImage: NSObject {
    
    //MARK: - Variáveis
    
    let url = "https://image.tmdb.org/t/p/w500"
    let url2 = "https://www.themoviedb.org/t/p/w440_and_h660_face"
    
    //MARK: - Funções
    
    func setImage(_ arquivo:String, completion: @escaping(UIImage) -> Void) {
        
        Alamofire.request(self.url2+arquivo).responseImage { response in
            if case .success(let image) = response.result {
                let imageFormated = image.af_imageRounded(withCornerRadius: 10)
                completion(imageFormated)
            }
        }
        
    }

}
