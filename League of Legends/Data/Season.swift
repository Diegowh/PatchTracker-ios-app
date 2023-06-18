//
//  Season.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 18/6/23.
//

import Foundation

struct Season: Codable, Hashable {
    var id: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
