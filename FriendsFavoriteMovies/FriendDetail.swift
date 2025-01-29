//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Hussain Shareef on 1/28/25.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: Friend
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    let isNew: Bool
    
    
    init(friend: Friend, isNew: Bool = false){
        self.friend = friend
        self.isNew = isNew
    }
    
   
    
    
    var body: some View {
        
        
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                Text("None").tag(nil as Movie?)
                ForEach(movies) { movie in Text(movie.title).tag(movie) }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if isNew {
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
}
