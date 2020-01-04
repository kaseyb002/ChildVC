//
//  PersonBasic.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/4/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import Foundation

protocol PersonBasic {
    var id: Int { get }
    var firstName: String { get }
    var lastName: String { get }
}

extension PersonBasic {
    
    var fullName: String {
        return firstName + " " + lastName
    }
}
