//
//  SeasonListView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 19/6/23.
//

import SwiftUI

struct SeasonListView: View {
    @State private var seasons: [Season] = []
    
    var body: some View {
        NavigationView {
            List(seasons, id: \.id) { season in
                NavigationLink(destination: PatchListView(season: season)) {
                    SeasonRowView(season: season)
                }
            }.navigationTitle("Seasons")
        }.onAppear {
            APIService.shared.fetchSeasons {
                fetchedSeasons in self.seasons = fetchedSeasons
            }
        }
    }
}

struct SeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonListView()
    }
}
