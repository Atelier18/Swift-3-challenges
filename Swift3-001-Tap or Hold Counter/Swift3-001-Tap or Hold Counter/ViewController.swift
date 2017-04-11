//
//  ViewController.swift
//  Swift3-001-Tap or Hold Counter
//
//  Created by Tomsqualm on 2017-04-10.
//  Copyright © 2017 Atelier18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var btnTapHold: UIButton!
    @IBOutlet weak var counterWrapper: UIView!
    
    var timer: Timer?
    
    var counting: Int = 0 {
        didSet {
            lblNumber.text = "\(counting)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add style programmatically
        counterWrapper.layer.cornerRadius = 150
        
        // Add GestureRecognizer to button
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.buttonTap))
        let gesturePress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.buttonPress))
        
        btnTapHold.addGestureRecognizer(gestureTap)
        btnTapHold.addGestureRecognizer(gesturePress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonReset(_ sender: Any) {
        counting = 0;
    }

    func buttonTap(sender: UIGestureRecognizer) {
        counting += 1;
    }
    
    func buttonPress(sender: UIGestureRecognizer) {
        if sender.state == .began {
            // start counting
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.buttonTap), userInfo: nil, repeats: true)
        }
        else if sender.state == .ended {
            // stop counting by invalidating timer
            timer?.invalidate()
        }
        
    }
    
}

