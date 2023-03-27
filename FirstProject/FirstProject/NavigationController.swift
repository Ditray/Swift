//
//  NavigationController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 07.12.2022.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {
    let interactiveTransnison = CustomInteractiveTransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            self.interactiveTransnison.viewController = toVC
            return PushAnimator()
        case .pop:
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransnison.viewController = toVC
            }
            return PopAnimatior()
        case .none:
            return nil
        @unknown default:
                fatalError("Error")
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransnison.hasStarted ? interactiveTransnison : nil
    }

}
