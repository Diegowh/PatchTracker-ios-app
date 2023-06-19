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
                        Image(systemName: "house.circle")
                    }
                EpisodeListView()
                    .tabItem {
                        Image(systemName: "v.circle")
                    }
                SeasonListView()
                    .tabItem {
                        Image(systemName: "l.circle")
                    }
            }
        }
    }
}
