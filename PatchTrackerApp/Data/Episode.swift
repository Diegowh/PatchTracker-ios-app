//
//  Episode.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import Foundation

struct Episode: Codable, Hashable {
    var id: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "episode_name"
    }
}

