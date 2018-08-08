//
//  createUserViewController.swift
//  YOUNADI
//
//  Created by etudiant on 01/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class createUserViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var Prenom: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var town: UITextField!
    @IBOutlet weak var codePostal: UITextField!
    @IBOutlet weak var sexe: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    var first = person()
    var utils = Utils()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nom.delegate = self
        self.Prenom.delegate = self
        self.age.delegate = self
        self.adress.delegate = self
        self.town.delegate = self
        self.codePostal.delegate = self
        self.sexe.delegate = self
        self.mail.delegate = self
        self.number.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func senregistrer(_ sender: Any) {
        print(first.major(a: Int(age.text!)!))
        print(first.description(b: String(mail.text!)))
        // checker si le mail est valide //
        if mail.text != nil && password.text != nil{
            Auth.auth().createUser(withEmail: mail.text!, password: password.text!){
                (authResult, error) in
                //verification des informations //
                if error != nil{
                    Utils.callAlert(vc: self, title: "Error", message: "Wrong mail or password", action: "OK")
                } else{
                    //ca s'enregistre dans le firebase//
                    Helper.sharedInstance.ref.child("users").child((authResult?.user.uid)!).setValue([
                        "nom": self.nom.text!,
                        "prenom": self.Prenom.text!,
                        "mail": self.mail.text!,
                        "id": authResult?.user.uid,
                        "age" : self.age.text!
                        ])
                    let user = User()
                    user.mail = self.mail.text!
                    user.nom = self.nom.text!
                    user.prenom = self.Prenom.text!
                    user.id = authResult?.user.uid
                    Utils.saveUserFromUserDefaults(user: user.getJson())
                    Helper.sharedInstance.user = user
                    //Helper.share.user = Utils.loadUserFromUserDefaults()!//
                    self.performSegue(withIdentifier: "connect", sender: nil)
                }
            }        } else {
            Utils.callAlert(vc: self, title: "error", message: "dommage", action: "move")
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
