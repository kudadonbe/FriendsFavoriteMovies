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
    
    @State private var newMovie: Movie?
    
    
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
            
        }
        _movies = Query(filter: predicate, sort: \Movie.title)
        
    }
    
    
    
    var body: some View {
 
        Group {
            if !movies.isEmpty {
                List {
                    
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                     
                    }
                    .onDelete(perform: deleteMovie(indexes:))
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
            .toolbar {
                
                ToolbarItem {
                    Button("Add Movie", systemImage: "plus", action: addMovie)
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
            .sheet(item: $newMovie) { movie in
                
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: Date.now)
        
        context.insert(newMovie)
        
        self.newMovie = newMovie
    }
    
    private func deleteMovie(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
   
}

#Preview("Filtered") {
    
    NavigationStack {
        MovieList(titleFilter: "e")
            .modelContainer(SampleData.shared.modelContainer)
    }
}


#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
