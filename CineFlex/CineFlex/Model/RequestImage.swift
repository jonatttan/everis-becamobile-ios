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
    
    //MARK: - Funções
    
    func setImage(_ url:String, completion: @escaping(UIImage) -> Void) {
        
        Alamofire.request(url).responseImage { response in
            if case .success(let image) = response.result {
                let imageFormated = image.af_imageRounded(withCornerRadius: 10)
                completion(imageFormated)
            }
        }
        
    }

}
