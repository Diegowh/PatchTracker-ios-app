//
//  PatchRowView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 19/6/23.
//

import SwiftUI

struct PatchRowView: View {
    let patch: Patch
    var body: some View {
        Text(patch.name)
    }
}
