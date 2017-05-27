//
//  ViewController.swift
//  Swift3-003-Custom Font
//
//  Created by Tomsqualm on 2017-04-15.
//  Copyright © 2017 Atelier18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblBold: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(lblBold.font)
        
        // Add UILabel and set custom font 🎸🤘🚀
        let label = UILabel()
        label.text = "Label created programmatically"
        label.font = FontBook.HeavyItalic.of(size: 30)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Constraints
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        ///label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

