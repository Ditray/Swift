//
//  PopAnimatior.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 07.12.2022.
//

import UIKit

class PopAnimatior: NSObject, UIViewControllerAnimatedTransitioning {
    let duration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVC = transitionContext.viewController(forKey: .from) else {return}
        guard let destinationVC = transitionContext.viewController(forKey: .to) else {return}
        
        transitionContext.containerView.addSubview(destinationVC.view)
        destinationVC.view.frame = sourceVC.view.frame
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        let translation = CGAffineTransform(translationX:-200, y: 0)
        destinationVC.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0, options: .calculationModeCubic) {
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.4) {
                destinationVC.view.transform = .identity
            }
            
        } completion: { completed in
            if completed && !transitionContext.transitionWasCancelled {
                sourceVC.view.transform = .identity
            }
            transitionContext.completeTransition(completed && !transitionContext.transitionWasCancelled)
        }

    }

}