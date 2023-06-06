//
//  PatchNote.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import Foundation

struct PatchNote: Codable, Hashable{
    var id: Int
    var version: String
    var release_date: String
    var episode: Int

    enum CodingKeys: String, CodingKey {
        case id
        case version
        case release_date
        case episode
    }
}

