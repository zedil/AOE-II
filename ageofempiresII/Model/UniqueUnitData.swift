//
//  UniqueUnitData.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 19.11.2022.
//

import Foundation

struct uniqueUnitData: Codable {
    let name: String
    let id: Int
    let description: String
    let expansion: String
    let age: String
    let build_time: Int
    let hit_points: Int
    let attack: Int
    let attack_bonus: [String]
}
