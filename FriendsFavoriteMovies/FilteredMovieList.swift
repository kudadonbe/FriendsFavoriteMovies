//
//  FilteredMovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/29/25.
//

import SwiftUI

struct FilteredMovieList: View {
    @State private var searchText: String = ""
    
    var body: some View {

        NavigationSplitView {
            
            MovieList(titleFilter: searchText).searchable(text: $searchText)
            
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
