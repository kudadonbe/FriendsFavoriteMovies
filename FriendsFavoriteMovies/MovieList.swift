//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/28/25.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MovieDetail(movie: movie)
                    }
                 
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add Movie", systemImage: "plus", action: addMovie)
                }
            }
            
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
    
    private func addMovie() {
        context.insert(Movie(title: "New Movie", releaseDate: Date.now))
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
