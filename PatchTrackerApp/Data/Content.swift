//
//  Patch.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

struct Content: Codable, Hashable {
    var id: Int
    var patch_note: Int
    var html_content: String

    enum CodingKeys: String, CodingKey {
        case id
        case patch_note
        case html_content
    }
}
