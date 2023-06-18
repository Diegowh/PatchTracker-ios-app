//
//  Patch.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 18/6/23.
//

import Foundation

struct Patch: Codable, Hashable{
    var id: Int
    var name: String
    var date: String
    var new_champion: String
    var url: String
    var season: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date
        case new_champion
        case url
        case season
    }
}
