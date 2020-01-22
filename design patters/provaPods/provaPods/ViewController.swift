//
//  ViewController.swift
//  provaPods
//
//  Created by user on 15/01/2020.
//  Copyright © 2020 dak. All rights reserved.
//

import UIKit
import anim

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBAction func animateTap(_ sender: UIButton) {
        // moves box to 100,100 with default settings
        anim {
            self.img.frame.origin = CGPoint(x:100, y:100)
        }

        // after that, waits 100 ms
        .wait(0.4)

        // moves box to 0,0 after waiting
        .then {
            self.img.frame.origin = CGPoint(x:0, y:0)
        }

        // displays message after all animations are done
        .callback {
            print("Just finished moving 📦 around.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}

