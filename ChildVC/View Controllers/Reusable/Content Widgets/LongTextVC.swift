//
//  LongCopyVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

final class LongTextVC: UIViewController {
    
    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private let text: String
    
    // MARK: Views
    @IBOutlet weak private var textLabel: UILabel! {
        didSet {
            textLabel.text = text
        }
    }
}
