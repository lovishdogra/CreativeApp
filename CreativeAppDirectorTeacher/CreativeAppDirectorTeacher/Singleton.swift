//
//  Singleton.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 26/11/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class Singleton: NSObject {
    
    var isAllSelectedSelected: Bool = false

    
    // Creating Singleton Instance of the Singleton Class
    static let shared : Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    
    // Clearing all the userdefault values
    func clearUserDefaultStoredValues(){
        userDef.set(nil, forKey: kKeyUserType)
        userDef.set(nil, forKey: kKeyUserId)
        userDef.synchronize()
    }
    
    
    
   
}
