//
//  SwiftExtension.swift
//  
//
//  Created by Rohit Singh on 26/11/16.
//
//

import UIKit

extension String {
    
    func localized(lang:String) -> String {
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        
    }
    
}
