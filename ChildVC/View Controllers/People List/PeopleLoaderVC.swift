//
//  ParentVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

final class PeopleLoaderVC: UIViewController {

    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init() {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private var state: State = .loading {
        didSet {
            update(with: state)
        }
    }
    private enum State {
        case loading
        case empty
        case error
        case loaded([PersonBasic])
    }
    
    // MARK: Views
    @IBOutlet weak private var containerView: UIView!
    private lazy var stateButton = UIBarButtonItem(
        title: "State",
        style: .plain,
        target: self,
        action: #selector(stateButtonPressed))
    
    // MARK: Child VCs
    private lazy var listVC = PeopleTVC(didSelectPerson: { [weak self] in
        self?.selected(person: $0)
    })
    private lazy var errorVC = NetworkErrorVC(didTapRetry: { [weak self] in
        self?.loadPeople()
    })
    private lazy var loadingVC = LoadingVC()
    private lazy var emptyVC = EmptyVC(image: UIImage(systemName: "person.3"),
                                       message: "No people found.")
}

// MARK: Lifecycle
extension PeopleLoaderVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "People"
        navigationItem.rightBarButtonItems = [stateButton]
        loadPeople()
    }
}

// MARK: Load Data
extension PeopleLoaderVC {
    
    private func loadPeople() {
        state = .loading
        PersonAPI.getPeople { [weak self] result in
            switch result {
            case .success(let people):
                guard !people.isEmpty else {
                    self?.state = .empty
                    return
                }
                self?.state = .loaded(people)
            case .failure:
                self?.state = .error
            }
        }
    }
}

// MARK: Actions
extension PeopleLoaderVC {
    
    private func selected(person: PersonBasic) {
        // you'd typically want a coordinator to handle this
        let vc = PersonDetailLoaderVC(personId: person.id)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func stateButtonPressed() {
        presentStateSelector()
    }
    
    private func presentStateSelector() {
        let alert = UIAlertController(title: "Select State", message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Success", style: .default) { _ in
            self.loadPeople()
        })
        alert.addAction(.init(title: "Empty", style: .default) { _ in
            self.state = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.state = .empty
            }
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
extension PeopleLoaderVC {
    
    private func update(with state: State) {
        switch state {
        case .loading:
            embed(loadingVC, into: containerView)
        case .empty:
            embed(emptyVC, into: containerView)
        case .error:
            embed(errorVC, into: containerView)
        case .loaded(let people):
            embed(listVC, into: containerView, fadeInDuration: 0.4)
            listVC.load(people)
        }
    }
}
