//
//  ViewController.swift
//  Swift3-002-Play local video
//
//  Created by Tomsqualm on 2017-04-10.
//  Copyright © 2017 Atelier18. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

//    var playViewController = AVPlayerViewController()
//    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let videoString: String? = Bundle.main.path(forResource: "toystory", ofType: "mp4")
        
//        let videoString:String? = Bundle.main.path(forResource: "toystory", ofType: ".mp4")
//        print(videoString)
//        if let url = videoString {
//            print(url)
//            let videoUrl = NSURL(fileURLWithPath: url)
//            self.player = AVPlayer(url: videoUrl as URL)
//            self.playerController.player = self.player
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playVideo(_ sender: Any) {
        print("here")
        if let path = Bundle.main.path(forResource: "toystory", ofType:"mp4") {
            print(path)
            let videoURL = NSURL(fileURLWithPath: path)
            
            let player = AVPlayer(url: videoURL as URL)
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.present(playerController, animated: true) {
                player.play()
            }
        
        }
    }

}

