//
//  CommonAnimations.swift
//  TallyHo
//
//  Created by Kelton Person on 3/17/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func alphaScreen(#alpha: CGFloat, baseColor: UIColor = UIColor.blackColor(), timeInterval: NSTimeInterval = 400.milliseconds) -> (UIView, PoppinAnimation) {
        let screen = UIView(frame: self.bounds)
        screen.backgroundColor = UIColor.clearColor()
        self.addSubview(screen)
        
        let fadeColor = baseColor.colorWithAlphaComponent(alpha)
        
        let alpaAnim = PoppinBasicBuilder(propertyName: kPOPViewBackgroundColor).to(fadeColor).time(timeInterval).build()
        let poppinAnim = PoppinAnimation(animation: alpaAnim, object: screen, key: "alphaScreenFade")
        return (screen, poppinAnim)
    }
    
    func alpaFade(#alpha: CGFloat, timeInterval: NSTimeInterval = 400.milliseconds) -> PoppinAnimation {
        let alpaAnim = PoppinBasicBuilder(propertyName: kPOPViewAlpha).to(alpha).time(timeInterval).build()
        let poppinAnim = PoppinAnimation(animation: alpaAnim, object: self, key: "alphaFade")
        return poppinAnim
    }
    
    func fadeOut(removeOnComplete: Bool = true, timeInterval: NSTimeInterval = 400.milliseconds) -> PoppinAnimation {
        let fade = self.alpaFade(alpha: 0, timeInterval: timeInterval)
        fade.registerForCompletion {
            if removeOnComplete {
                self.removeFromSuperview()
            }
        }
        return fade
    }
    
    func addToCenter(view: UIView) {
        self.addSubview(view)
        view.center = self.center
    }
    
    
}