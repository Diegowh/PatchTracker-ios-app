//
//  PatchListView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct PatchNoteListView: View {
    var episode: Episode
    @State private var patchNotes: [PatchNote] = []
    
    var body: some View {
        VStack {
            Text(episode.name).font(.title).fontWeight(.semibold).multilineTextAlignment(.center).padding(.top)
            List(patchNotes, id: \.id) { patchNote in
                NavigationLink(
                    destination: ContentView(patchNote: patchNote),
                    label: { PatchNoteRowView(patchNote: patchNote) }
                )
            }
        }.onAppear {
            APIService.shared.fetchPatchNotes { fetchedPatchNotes in
                self.patchNotes = fetchedPatchNotes.filter { $0.episode == self.episode.id }
            }
        }
    }
}



