//
//  leagueImageView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 11/6/23.
//

import SwiftUI

struct LeagueImageView: View {
    var body: some View {
        NavigationLink(destination: LoLPlaceholderView()) {
                        Image("lol-logo")
                            .resizable()
                            .scaledToFill()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()
                            .background(Color(red: 1, green: 0.5, blue: 0.5))
                            .clipShape(Circle())
                            .shadow(radius: 10)
        }.padding(.horizontal)
    }
}

struct LeagueImageView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueImageView()
    }
}
