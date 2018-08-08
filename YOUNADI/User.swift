//
//  User.swift
//  YOUNADI
//
//  Created by etudiant on 01/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import Foundation
import SwiftyJSON

public class User{
    public var nom: String?
      public var id: String?
    public var prenom: String?
    public var age: Int?
    public var adress: String?
    public var town: String?
    public var codPostal: String?
    public var sex : String?
    public var mail: String?
    public var number: Int?
    public var password: Int?
    
    public func getnom() -> String?{
        return nom
    }
    public func getprenom() -> String?{
        return prenom
    }
    public func getage() -> Int?{
        return age
    }
    public func getadress() -> String?{
        return adress
    }
    public func gettown() -> String?{
        return town
    }
    public func getcodPostal() -> String?{
        return codPostal
    }
    public func getsex() -> String?{
        return sex
    }
    public func getmail() -> String?{
        return mail
    }
    public func getnumber() -> Int?{
        return number
    }
    public func getpassword() -> Int?{
        return password
    }
    
    public init(){
        
    }
    public init (json : JSON){
        self.prenom = json["prenom"].stringValue
        self.mail = json["mail"].stringValue
    }
    
    public func getJson() -> JSON?{
        let user = [
            "prenom" :  self.prenom!,
            "mail" : self.mail!,
        ]
        
        return JSON(user)
        
    }
}
