//
//  NetworkErrorVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

class NetworkErrorVC: UIViewController {

    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(didTapRetry: @escaping () -> ()) {
        self.didTapRetry = didTapRetry
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    private let didTapRetry: () -> ()

    @IBAction private func retryButtonPressed(_ sender: UIButton) {
        didTapRetry()
    }
}
