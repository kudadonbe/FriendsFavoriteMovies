//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/28/25.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    
    
    var body: some View {
        
        Form {
            TextField("Title", text: $movie.title)
                .autocorrectionDisabled(true)
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
    
}
