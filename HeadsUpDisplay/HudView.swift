//
//  HudView.swift
//  HeadsUpDisplay
//
//  Created by Xing Hui Lu on 1/14/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit

class HudView: UIView {
    var text = ""
    
    class func hudInView(view: UIView, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.opaque = false
        
        view.addSubview(hudView)
        view.userInteractionEnabled = false
        
        hudView.showAnimated(animated)
        return hudView
    }
    
    override func drawRect(rect: CGRect) {
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        
        let boxRect = CGRect(
            x: (bounds.size.width - boxWidth)/2,                // Subtract with from total size
            y: (bounds.size.height - boxHeight)/2,              // and divide by 2 so both ends are equal
            width: boxWidth,
            height: boxHeight)
        
        let roundRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        
        UIColor(white: 0.3, alpha: 0.8).setFill()               // Gray color box
        roundRect.fill()
        
        if let image = UIImage(named: "Checkmark") {
            let imagePoint = CGPoint(
                x: center.x - round(image.size.width/2),
                y: center.y - round(image.size.height/2) - boxHeight/8)
            
            image.drawAtPoint(imagePoint)                       // Draw the image at a specific point
        }
        
        let attribs = [
            NSFontAttributeName: UIFont.systemFontOfSize(16),
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        
        let textSize = text.sizeWithAttributes(attribs)         // Give specific attributes and find size
        let textPoint = CGPoint(
            x: center.x - round(textSize.width/2),              // Place the text in the middle
            y: center.y - round(textSize.height/2) + boxHeight/4)   // Place the text in the center + 1/4 of the box
        
        text.drawAtPoint(textPoint, withAttributes: attribs)    // Draw the text at the specific point
    }
    
    func showAnimated(animated: Bool) {
        if animated {
            alpha = 0                                           // Set up alpha
            transform = CGAffineTransformMakeScale(1.3, 1.3)    // Set up the transform
            
//            UIView.animateWithDuration(0.3, animations: { () -> Void in
//                self.alpha = 1                                  // Final alpha
//                self.transform = CGAffineTransformIdentity      // Place it back to its original transform
//            })
            
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
                self.alpha = 1
                self.transform = CGAffineTransformIdentity
            }, completion: nil)
        }
    }
}
