//
//  PatchRowView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct PatchNoteRowView: View {
    let patchNote: PatchNote
    
    var body: some View {
        Text(patchNote.version)
    }
}
