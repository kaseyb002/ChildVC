//
//  PeopleTVC.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import UIKit

class PeopleTVC: UITableViewController {
    
    // MARK: Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    
    init(didSelectPerson: @escaping (PersonBasic) -> ()) {
        self.didSelectPerson = didSelectPerson
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    // MARK: Data Properties
    private var people = [PersonBasic]() {
        didSet {
            tableView.reloadData()
        }
    }
    private let didSelectPerson: (PersonBasic) -> ()
}

// MARK: Loading
extension PeopleTVC {
    
    func load(_ people: [PersonBasic]) {
        self.people = people
    }
}

// MARK: Data Source
extension PeopleTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = person.fullName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: Delegate
extension PeopleTVC {
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = people[indexPath.row]
        didSelectPerson(person)
    }
}
