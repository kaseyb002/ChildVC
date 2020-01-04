//
//  Person.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import Foundation

struct Person {
    let id: Int
    let firstName: String
    let lastName: String
    let imageName: String
    let bio: String
}

extension Person: PersonBasic {}
