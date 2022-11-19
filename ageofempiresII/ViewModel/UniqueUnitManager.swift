//
//  UniqueUnitManager.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 19.11.2022.
//

import Foundation

protocol UniqueUnitManagerDelegate {
    func didUpdateUniqueUnit(uniqueUnit: UniqueUnitModel)
}

struct UniqueUnitManager {
    
    var delegate : UniqueUnitManagerDelegate?
    
    func sendRequest(url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let uniqueUnit = parseJSON(aoeData: safeData) {
                        
                        self.delegate?.didUpdateUniqueUnit(uniqueUnit: uniqueUnit)
                    }

                }
            }
            task.resume()
        }
    }
    
    func parseJSON(aoeData: Data) -> UniqueUnitModel? {
        let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(uniqueUnitData.self, from: aoeData)
                
                let name = decodedData.name
                let id = decodedData.id
                let description = decodedData.description
                let expansion = decodedData.expansion
                let age = decodedData.age
                let build_time = decodedData.build_time
                let hit_points = decodedData.hit_points
                let attack = decodedData.attack
                let attack_bonus = decodedData.attack_bonus
                
                
                let uniqueUnit = UniqueUnitModel(name: name, id: id, description: description, expansion: expansion, age: age, build_time: build_time, hit_points: hit_points, attack: attack, attack_bonus: attack_bonus)
                
                
                return uniqueUnit
                 
             } catch {
                 print(error)
                 return nil
                 
        }
    }
}
