//
//  RowView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct EpisodeRowView: View {
    
    var episode: Episode
    
    var body: some View {
        HStack {
            Text(episode.name)
                .frame(height: 50)
            Spacer()
        }
    }
}

struct EpisodeRowView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRowView(episode: Episode(id: 1, name: "Episode 01: IGNITION"))
            .background(Color(.gray))
    }
}
