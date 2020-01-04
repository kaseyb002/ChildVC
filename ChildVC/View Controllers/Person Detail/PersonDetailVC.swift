//
//  PersonDetailVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

class PersonDetailVC: UIViewController {

    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(person: Person) {
        self.person = person
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private let person: Person
    
    // MARK: Views
    @IBOutlet weak private var profileHeaderView: UIView! {
        didSet {
            embed(headerVC, into: profileHeaderView)
        }
    }
    @IBOutlet weak private var bioView: UIView! {
        didSet {
            embed(bioVC, into: bioView)
        }
    }
    
    // MARK: Child VCs
    private lazy var headerVC = CircleImageWithLabelVC(
        headerText: person.fullName,
        image: UIImage(named: person.imageName)!)
    private lazy var bioVC = LongTextVC(text: person.bio)
}
