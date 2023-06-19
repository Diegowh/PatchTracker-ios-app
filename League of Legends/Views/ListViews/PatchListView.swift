//
//  PatchListView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 19/6/23.
//

import SwiftUI

struct PatchListView: View {
    var season: Season
    @State private var patches: [Patch] = []
    
    var body: some View {
        VStack {
            Text(season.name)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top)
            List(patches, id: \.id) { patch in
                NavigationLink(
                    destination: NoteView(patch: patch),
                    label: {
                        PatchRowView(patch: patch) }
                )
            }
        }.onAppear {
            APIService.shared.fetchPatches {
                fetchedPatches in
                self.patches =
                fetchedPatches.filter {
                    $0.season == self.season.id
                }
            }
        }
    }
}
