//
//  File.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/28/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate: Date
    
    
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData: [Movie] = [
        Movie(title: "Fathis Handhuvaru", releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Nafurathu", releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Dheriya", releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "Hadhiya", releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "Huvafen", releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "Edhuvas", releaseDate: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
        ]
}
