//
//  PersonDetailLoaderVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

final class PersonDetailLoaderVC: UIViewController {
    
    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(personId: Int) {
        self.personId = personId
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private let personId: Int
    private var state: State = .loading {
        didSet {
            update(with: state)
        }
    }
    private enum State {
        case loading
        case error
        case loaded(Person)
    }
    
    // MARK: Views
    @IBOutlet weak private var containerView: UIView!
    private lazy var stateButton = UIBarButtonItem(
        title: "State",
        style: .plain,
        target: self,
        action: #selector(stateButtonPressed))
    
    // MARK: Child VCs
    private var personDetailVC: PersonDetailVC?
    private lazy var errorVC = NetworkErrorVC(didTapRetry: { [weak self] in
        self?.loadPerson()
    })
    private lazy var loadingVC = LoadingVC()
}

// MARK: Lifecycle
extension PersonDetailLoaderVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Person Detail"
        navigationItem.rightBarButtonItems = [stateButton]
        loadPerson()
    }
}

// MARK: Loading
extension PersonDetailLoaderVC {
    
    private func loadPerson() {
        state = .loading
        PersonAPI.getPerson(byId: personId) { [weak self] result in
            switch result {
            case .success(let person):
                self?.state = .loaded(person)
            case .failure:
                self?.state = .error
            }
        }
    }
}

// MARK: Actions
extension PersonDetailLoaderVC {
    
    @objc
    func stateButtonPressed() {
        presentStateSelector()
    }
    
    private func presentStateSelector() {
        let alert = UIAlertController(title: "Select State", message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Success", style: .default) { _ in
            self.loadPerson()
        })
        alert.addAction(.init(title: "Error", style: .default) { _ in
            self.state = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.state = .error
            }
        })
        present(alert, animated: true, completion: nil)
    }
}

// MARK: Update UI
extension PersonDetailLoaderVC {
    
    private func update(with state: State) {
        switch state {
        case .loading:
            embed(loadingVC, into: containerView)
        case .error:
            embed(errorVC, into: containerView)
        case .loaded(let person):
            let vc = PersonDetailVC(person: person)
            personDetailVC = vc
            embed(vc, into: containerView, fadeInDuration: 0.4)
        }
    }
}
