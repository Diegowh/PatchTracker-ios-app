//
//  ListView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct EpisodeListView: View {
    @State private var episodes: [Episode] = []
    
    var body: some View {
        NavigationView {
            List(episodes, id: \.id) { episode in
                NavigationLink(destination: PatchNoteListView(episode: episode)) {
                    EpisodeRowView(episode: episode)
                }
            }.navigationTitle("Episodes")
        }.onAppear {
            APIService.shared.fetchEpisodes { fetchedEpisodes in
                self.episodes = fetchedEpisodes
            }
        }
    }
}

struct EpisodeListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListView()
    }
}
