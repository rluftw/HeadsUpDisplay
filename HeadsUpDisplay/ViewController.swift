//
//  ViewController.swift
//  HeadsUpDisplay
//
//  Created by Xing Hui Lu on 1/14/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit
import Dispatch

class ViewController: UIViewController {
    var hudView: HudView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pressMe(sender: UIButton) {
        hudView = HudView.hudInView(view, animated: true)
        hudView?.text = "Pressed!"
        
        let delayInSeconds = 0.6
        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds*Double(NSEC_PER_SEC)))
        
        dispatch_after(when, dispatch_get_main_queue()) { () -> Void in
            self.hudView?.removeFromSuperview()
        }
    }
}

