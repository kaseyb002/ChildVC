//
//  UIViewController+Extensions.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

// MARK: Embedding Child VCs
extension UIViewController {
    
    func embed(_ childVC: UIViewController,
               into container: UIView,
               fadeInDuration: TimeInterval? = nil) {
        container.subviews.forEach { $0.removeFromSuperview() }
        
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
        
        childVC.willMove(toParent: self)
        
        addChild(childVC)
        
        childVC.view.frame = container.bounds
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(childVC.view)
        
        NSLayoutConstraint.activate([
            childVC.view.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: childVC.view.bottomAnchor, constant: 0),
            
            childVC.view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: childVC.view.trailingAnchor, constant: 0)
        ])
        
        childVC.didMove(toParent: self)
        
        container.backgroundColor = .clear // IB has default white background which is annoying
        
        if let fadeInDuration = fadeInDuration {
            container.alpha = 0.0
            UIView.animate(withDuration: fadeInDuration) { container.alpha = 1.0 }
        }
    }
}
