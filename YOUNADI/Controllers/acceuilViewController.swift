//
//  acceuilViewController.swift
//  YOUNADI
//
//  Created by etudiant on 03/08/2018.
//  Copyright © 2018 extraction. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class acceuilViewController: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var download: UILabel!
    var list = ["video", "g"]
    
    @IBAction func enregistrement(_ sender: Any) {
    }
    
    @IBAction func play(_ sender: Any) {
        playVideo(str : text.text!)
    }
    
    @IBAction func retour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }
    
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*let playerController = AVPlayerViewController()
    private func playVideo(str : String) {
        let path = URL(string: str)!
        
        
        let player = AVPlayer(url:   path )
        
        mView.addSubview(playerController.view)
        playerController.view.frame = mView.frame
        playerController.player = player
        playerController.showsPlaybackControls = false
        NotificationCenter.default.addObserver(self, selector: #selector(acceuilViewController.finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        playerController.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
        playerController.player?.play()
        self.present(playerController, animated: true) {
            self.playerController.player!.play()
        }
        
    }
    
    @objc func finishVideo()
    {
        
    }*/
    
    let playerController = AVPlayerViewController()
    private func playVideo(str : String) {
        guard let path = Bundle.main.path(forResource: str , ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        mView.addSubview(playerController.view)
        playerController.view.frame = mView.frame
        playerController.player = player
        playerController.showsPlaybackControls = false
        NotificationCenter.default.addObserver(self, selector: #selector(acceuilViewController.finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        playerController.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
        playerController.player?.play()
        self.present(playerController, animated: true) {
            self.playerController.player!.play()
        }
        
    }
    @objc func finishVideo()
    {
        
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
