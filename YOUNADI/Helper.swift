//
//  Helper.swift
//  YOUNADI
//
//  Created by etudiant on 02/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseCore

public class Helper {
    
    public static var sharedInstance = Helper()
    var user = User()
    var url = ""
    var ref = Database.database().reference()
    var list = [User]()
    var listLike = [String]()
    
}
