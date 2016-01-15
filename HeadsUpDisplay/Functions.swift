//
//  Functions.swift
//  HeadsUpDisplay
//
//  Created by Xing Hui Lu on 1/15/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import Foundation
import Dispatch

func afterDisplay(seconds: Double, completion: () -> ()) {
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_MSEC)))
    dispatch_after(when, dispatch_get_main_queue(), completion)
}
