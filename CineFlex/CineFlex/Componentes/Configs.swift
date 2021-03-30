//
//  Configs.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 30/03/21.
//

import UIKit

class Configs: NSObject {
    
    func way() -> NSDictionary? {
        guard let wayToPlist = Bundle.main.path(forResource: "Info", ofType: "plist") else {return nil}
        guard let dict = NSDictionary(contentsOfFile: wayToPlist) else { return nil }
        return dict
    }
    
    func urlTendencias() -> String? {
        guard let dict = way() else { return nil }
        guard let url = dict["URLListTendenciasSemana"] as? String else { return nil }
        return url
    }
    
    func apiKey() -> String? {
        guard let dict = way() else { return nil }
        guard let url = dict["APIKey"] as? String else { return nil }
        return url
    }
    
    func urlDetalhes() -> String? {
        guard let dict = way() else { return nil }
        guard let url = dict["URLListDetalhesFilme"] as? String else { return nil }
        return url
    }
}
