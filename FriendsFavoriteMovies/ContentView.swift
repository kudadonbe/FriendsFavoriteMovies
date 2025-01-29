//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
          Tab("Amiche", systemImage: "figure.and.child.holdinghands"){
              FriendList()
          }
          Tab("Cinema", systemImage: "movieclapper"){
              
//              MovieList()
              FilteredMovieList()
              
          }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}

