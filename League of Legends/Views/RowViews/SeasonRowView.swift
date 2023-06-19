//
//  SeasonRowView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 19/6/23.
//

import SwiftUI

struct SeasonRowView: View {
    var season: Season
    var body: some View {
        HStack {
            Text(season.name)
                .frame(height: 50)
            Spacer()
        }
    }
}

struct SeasonRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonRowView(season: Season(id: 1, name: "Season Ten"))
            .background(Color(.gray))
    }
}
