//
//  Note.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 18/6/23.
//

import Foundation

struct Note: Codable, Hashable {
    var id: Int
    var html: String
    var patch: Int

    enum CodingKeys: String, CodingKey {
        case id
        case html
        case patch
    }
}
