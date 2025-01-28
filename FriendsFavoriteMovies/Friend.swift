//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/28/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Minnu"),
        Friend(name: "Dheeh"),
        Friend(name: "Thitha"),
        Friend(name: "Wiroo"),
        Friend(name: "Thutha"),
    ]
}
