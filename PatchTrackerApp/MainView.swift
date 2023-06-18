//
//  MainView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1, green: 0.4, blue: 0.3)
                VStack {
                    Text("Patch Tracker")
                    // HStack {
                    // ValorantImageView()
                    //Spacer()
                    //LeagueImageView()
                    //}
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
