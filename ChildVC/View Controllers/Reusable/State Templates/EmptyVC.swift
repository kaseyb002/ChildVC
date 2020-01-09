//
//  EmptyVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

final class EmptyVC: UIViewController {

    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(image: UIImage? = UIImage(systemName: "minus.rectangle"),
         message: String) {
        self.image = image
        self.message = message
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private let image: UIImage?
    private let message: String
    
    // MARK: Views
    @IBOutlet weak private var imageView: UIImageView! {
        didSet {
            imageView.image = image
        }
    }
    @IBOutlet weak private var messageLabel: UILabel! {
        didSet {
            messageLabel.text = message
        }
    }
}
