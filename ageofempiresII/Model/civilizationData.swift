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
    let name: String
    let id: Int
    let team_bonus: String
    let army_type: String
    let civilization_bonus: [String]
}
