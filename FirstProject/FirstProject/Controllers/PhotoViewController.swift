//
//  PhotoView.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 04.12.2022.
//

import UIKit

class PhotoViewController: UIViewController {
    let padding: CGFloat = 394
    @IBOutlet var photoView: UIImageView!
    var photos: [UIImage]!
    var propertyAnimator: UIViewPropertyAnimator!
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoView.image = photos[0]
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipe(_:)))
        self.view.addGestureRecognizer(rightSwipeRecognizer)
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe(_:)))
        leftSwipeRecognizer.direction = .left
        self.view.addGestureRecognizer(leftSwipeRecognizer)
        
    }
    
    @objc func leftSwipe(_ recognizer: UISwipeGestureRecognizer){
        let const: CGFloat!
        if counter > 0 {
            const = 0
        } else {
            
            const = -padding
            
        }
        UIView.animateKeyframes(withDuration: 0.6,
                                delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.3) {
                self.photoView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3,
                               relativeDuration: 0.3) {
                self.photoView.transform = CGAffineTransform(translationX: const, y: 0)
            }
            
        }
        counter-=1
    }
    
       @objc func rightSwipe(_ recognizer: UISwipeGestureRecognizer){
           
           let const: CGFloat!
           if counter < 0 {
               const = 0
           } else {
               
               const = padding
               
           }
        
           UIView.animateKeyframes(withDuration: 0.6,
                                delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.3) {
                self.photoView.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }
               UIView.addKeyframe(withRelativeStartTime: 0.3,
                                  relativeDuration: 0.3) {
                self.photoView.transform = CGAffineTransform(translationX:const, y: 0)
            }
        }
           counter+=1
        
    }

}
