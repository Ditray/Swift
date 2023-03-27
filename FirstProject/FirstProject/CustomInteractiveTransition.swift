//
//  CustomInteractiveTransition.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 07.12.2022.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController? {
        
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
            recognizer.edges = .left
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    var shouldFinish: Bool = false
    
    @objc func panGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        
        switch recognizer.state {
            
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let translationInPercent = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1,translationInPercent))
            
            self.shouldFinish = progress > 0.33
            
            self.update(progress)
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish(): self.cancel()
        case .cancelled:
            self.hasStarted = false
            self.cancel()
        @unknown default:
            return
        }
        
    }
}
