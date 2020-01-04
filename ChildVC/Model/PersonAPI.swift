//
//  PersonAPI.swift
//  ChildVC
//
//  Created by Kasey Baughan on 1/3/20.
//  Copyright © 2020 Kasey Baughan. All rights reserved.
//

import Foundation

class PersonAPI {
    
    static func getPeople(callback: @escaping (Result<[Person], ErrorMessage>) -> ()) {
        let delay = TimeInterval.random(in: 0.5...2)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            callback(.success(mockData))
        }
    }
    
    static func getPerson(byId id: Int, callback: @escaping (Result<Person, ErrorMessage>) -> ()) {
        let delay = TimeInterval.random(in: 0.5...2)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            guard let person = mockData.first(where: { $0.id == id }) else {
                callback(.failure(.init(message: "Person not found")))
                return
            }
            callback(.success(person))
        }
    }
}

// MARK: Mock Data
extension PersonAPI {
    
    private static let mockData: [Person] = [
        .init(id: 1,
              firstName: "Ralph",
              lastName: "Smith",
              imageName: "ralph",
              bio: loremIpsum),
        .init(id: 2,
              firstName: "Jake",
              lastName: "Wills",
              imageName: "jake",
              bio: loremIpsum),
        .init(id: 3,
              firstName: "Kate",
              lastName: "Applebaum",
              imageName: "kate",
              bio: loremIpsum),
        .init(id: 4,
              firstName: "Jim",
              lastName: "Toofer",
              imageName: "jim",
              bio: loremIpsum),
    ]
    
    private static let loremIpsum = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet eget sit amet tellus. Amet risus nullam eget felis eget. Pulvinar proin gravida hendrerit lectus a. Integer malesuada nunc vel risus commodo viverra. Quam id leo in vitae turpis massa sed elementum tempus. Mattis pellentesque id nibh tortor id aliquet. At urna condimentum mattis pellentesque id nibh tortor id. Leo urna molestie at elementum eu facilisis sed odio. Et netus et malesuada fames ac turpis egestas. Molestie at elementum eu facilisis sed odio. Elementum nibh tellus molestie nunc non blandit massa enim. Eget nulla facilisi etiam dignissim diam. Quis imperdiet massa tincidunt nunc pulvinar sapien et. Amet justo donec enim diam vulputate ut. Aliquam purus sit amet luctus venenatis lectus magna fringilla urna.

Potenti nullam ac tortor vitae purus faucibus ornare suspendisse sed. Libero id faucibus nisl tincidunt eget nullam non. Est ultricies integer quis auctor elit sed vulputate mi sit. Nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue. Augue neque gravida in fermentum et sollicitudin ac. Sit amet aliquam id diam maecenas. Urna molestie at elementum eu facilisis sed odio. Gravida rutrum quisque non tellus orci ac auctor augue. Id consectetur purus ut faucibus. Mattis pellentesque id nibh tortor id aliquet. Amet tellus cras adipiscing enim eu turpis egestas pretium. Phasellus faucibus scelerisque eleifend donec pretium. Ultrices vitae auctor eu augue ut lectus arcu. Suspendisse faucibus interdum posuere lorem ipsum dolor sit. Tristique senectus et netus et malesuada fames ac turpis egestas. Nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus. Faucibus scelerisque eleifend donec pretium vulputate sapien nec.

Egestas maecenas pharetra convallis posuere morbi leo urna. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Risus ultricies tristique nulla aliquet enim tortor at auctor urna. Massa tempor nec feugiat nisl pretium fusce. Magnis dis parturient montes nascetur ridiculus mus mauris. Donec massa sapien faucibus et molestie ac feugiat. Sit amet porttitor eget dolor morbi non. Enim praesent elementum facilisis leo vel. Ac turpis egestas maecenas pharetra convallis posuere morbi leo. Purus non enim praesent elementum facilisis.

Arcu risus quis varius quam quisque id diam. Mauris rhoncus aenean vel elit scelerisque mauris. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Arcu risus quis varius quam quisque id diam. Ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Ut pharetra sit amet aliquam. Ut consequat semper viverra nam libero justo. Augue ut lectus arcu bibendum at varius vel pharetra vel. Non enim praesent elementum facilisis. Libero enim sed faucibus turpis in eu. Eu consequat ac felis donec. Morbi quis commodo odio aenean sed. Adipiscing bibendum est ultricies integer quis auctor elit. Odio aenean sed adipiscing diam donec adipiscing tristique risus. Est ultricies integer quis auctor elit sed vulputate. Ornare arcu dui vivamus arcu. Ac placerat vestibulum lectus mauris ultrices eros in. Sit amet venenatis urna cursus.

Scelerisque varius morbi enim nunc faucibus a pellentesque sit amet. Vivamus arcu felis bibendum ut tristique et egestas quis. Euismod nisi porta lorem mollis aliquam ut porttitor. Turpis egestas pretium aenean pharetra magna ac placerat. At risus viverra adipiscing at in. Scelerisque varius morbi enim nunc faucibus a. Mattis rhoncus urna neque viverra justo nec. Imperdiet proin fermentum leo vel orci porta non pulvinar. Lectus mauris ultrices eros in cursus turpis. Morbi leo urna molestie at elementum eu. Luctus accumsan tortor posuere ac ut consequat semper viverra nam. Urna nunc id cursus metus aliquam. Ut porttitor leo a diam sollicitudin tempor. Suspendisse faucibus interdum posuere lorem ipsum dolor sit.
"""
}

// MARK: Helper Models
struct ErrorMessage: Error {
    let message: String
}
