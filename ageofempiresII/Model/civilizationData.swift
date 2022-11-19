//
//  civilizationData.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 18.09.2022.
//

import Foundation

struct civilizationData: Codable {
    let civilizations: [Civilizations]
}

struct Civilizations: Codable {
    let id: Int
    let name: String
    let army_type: String
    let team_bonus: String
    let unique_unit: [String]
    let civilization_bonus: [String]
}

/*
struct UniqueUnit: Codable {
    let name: String
    let description: String
    let age: String
    let attack: Int
    let hit_points: Int
    let build_time: Int
} */
