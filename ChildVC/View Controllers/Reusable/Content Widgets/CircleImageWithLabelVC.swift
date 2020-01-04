//
//  CircleImageWithLabelVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

class CircleImageWithLabelVC: UIViewController {
    
    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(headerText: String,
         image: UIImage) {
        self.headerText = headerText
        self.image = image
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private let headerText: String
    private let image: UIImage
    
    // MARK: Views
    @IBOutlet weak private var headerLabel: UILabel! {
        didSet {
            headerLabel.text = headerText
        }
    }
    @IBOutlet weak private var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
            imageView.image = image
        }
    }
}
