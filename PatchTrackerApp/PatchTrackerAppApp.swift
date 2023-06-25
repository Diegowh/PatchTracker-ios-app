//
//  PatchTrackerAppApp.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 4/6/23.
//

import SwiftUI

@main
struct PatchTrackerAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MainView()
                    .tabItem() {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                EpisodeListView()
                    .tabItem() {
                        Image(systemName: "cross.circle.fill")
                        Text("Valorant")
                    }
                SeasonListView()
                    .tabItem() {
                        Image(systemName: "l.square")
                        Text("LoL")
                    }
            }
        }
    }
}
