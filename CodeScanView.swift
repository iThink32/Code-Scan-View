//
//  CodeScanView.swift
//  QRCodeGenerator
//
//  Created by N A Shashank on 12/15/17.
//  Copyright © 2017 N A Shashank. All rights reserved.
//

import UIKit

class CodeScanView: UIView,CAAnimationDelegate {

    @IBInspectable var scanColor:UIColor = UIColor.red
    @IBInspectable var borderWidth:CGFloat = CGFloat(2.0)
    
    enum ScanStatus{
        case running
        case stopped
    }
    
    var scanStatus = ScanStatus.stopped
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("nothing to do here")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let unwrappedAnimation = anim as? CABasicAnimation , self.scanStatus == ScanStatus.running else{
            self.layer.borderColor = UIColor.clear.cgColor
            return
        }
        let animation = self.createBasicAnimation(fromColor: unwrappedAnimation.toValue as! CGColor, toColor: unwrappedAnimation.fromValue as! CGColor)
        //remove prev animation just to be sure
        self.layer.removeAnimation(forKey: "color")
        self.layer.add(animation, forKey: "color")
    }
    
    func beginScanAnimation()
    {
        self.scanStatus = ScanStatus.running
        let animation = self.createBasicAnimation(fromColor: UIColor.clear.cgColor, toColor: self.scanColor.cgColor)
        //remove prev animation just to be sure
        self.layer.removeAnimation(forKey: "color")
        self.layer.add(animation, forKey: "color")
    }
    
    func createBasicAnimation(fromColor:CGColor,toColor:CGColor) -> CABasicAnimation
    {
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = fromColor
        animation.toValue = toColor
        animation.delegate = self
        animation.duration = 1
        animation.repeatCount = 0
        """
        this is because a CABasicAnimation creates a presentation layer(CALayer) and animates it after which it is removed
        by ios so to preserve the state after the animation you have to set the end result of the animation on the actual
        layer.THIS STEP IS VERY IMP PLS DO NOT REMOVE IT !
        """
        self.layer.borderColor = toColor
        return animation
    }
    
    func stopScanAnimation()
    {
        self.scanStatus = ScanStatus.stopped
        self.layer.removeAllAnimations()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
