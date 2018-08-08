//
//  SignInViewController.swift
//  YOUNADI
//
//  Created by etudiant on 01/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {

    @IBOutlet weak var mail: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func connexion(_ sender: Any) {
       
        connect()
    }
    @IBAction func retour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func connect(){
        //Check
        if  mail.text != nil && password.text != nil {
            
            //Sign In with Firebase
            Auth.auth().signIn(withEmail: mail.text!, password: password.text!) { (user, error) in
                if error != nil {
                    //Signin Error
                    let alert = UIAlertController(title: "Username or password is incorrect", message: "", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                } else {
                    
                    //SignIn Correct
                    Helper.sharedInstance.ref.child("users").child((user?.user.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        let value = snapshot.value as? NSDictionary
                        let prenom = value?["nom"] as? String ?? ""
                        let mail = value?["mail"] as? String ?? ""
                        let id = value?["id"] as? String ?? ""
                        
                        //init user
                        let user = User()
                        user.mail = mail
                        user.prenom = prenom
                        user.id = id
                        
                        // Save user in local
                        Helper.sharedInstance.user = user
                        
                       self.performSegue(withIdentifier: "signin", sender: nil)
                        
                    }) { (error) in
                        print(error.localizedDescription)
                    }
                    
                }
            }
        } else {
            Utils.callAlert(vc: self, title: "error", message: "okoko", action: "nhbgf")
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
