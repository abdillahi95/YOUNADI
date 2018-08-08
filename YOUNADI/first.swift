//
//  first.swift
//  YOUNADI
//
//  Created by etudiant on 01/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import Foundation

public class person{
    
    public func major(a: Int) -> Bool{
        if a >= 18{
            return true
        } else {
            return false
        }
    }
    public func description(b: String) -> String{
        if b == "Homme"{
            return "Vous êtes un homme"
        } else {
            return "Vous êtes une femme"
        }
    }
}
