//
//  ConnectViewController.swift
//  YOUNADI
//
//  Created by etudiant on 02/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
    
 
    @IBAction func retour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var profile: UILabel!
    
    @IBOutlet weak var phrasedAccroche: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let result = helper.user.mail//
        profile.text = Helper.sharedInstance.user.mail
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
