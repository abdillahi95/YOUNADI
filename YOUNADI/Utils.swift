//
//  Utils.swift
//  YOUNADI
//
//  Created by etudiant on 01/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import SystemConfiguration
import SwiftyJSON
import Foundation
import UIKit

public class Utils{
    public static func isInternetAvailable() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    public static func checkMail(mail : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: mail)
    }
    public static func checkPass(pass: String) -> Bool{
        if pass.count > 8 {
            return true
        } else{
            return false
        }
    }
    public static func callAlert(vc: UIViewController, title: String, message : String, action: String) {
        let alert = UIAlertController(title : title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .cancel, handler: nil))
        vc.present(alert, animated: true)
    }
    public static func loadUserFromUserDefaults()->User?{
        var user : User?
        let defaults = UserDefaults.standard
        if defaults.value(forKey: "User") != nil
        {
            user = User(json: JSON.init(parseJSON : defaults.value(forKey: "User") as! String))
            return user
        }
        return nil
    }
    public static func saveUserFromUserDefaults(user : JSON?){
        let defaults = UserDefaults.standard
        defaults.setValue(user?.rawString()!, forKey: "User")
    }
    public static func logOut(){
        UserDefaults.standard.set(nil, forKey: "User")
    }
}

