//
//  CivilizationManager.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 18.09.2022.
//

import Foundation

protocol CivilizationManagerDelegate {
    func didUpdateCivilization(civilization: CivilizationModel)
}

struct CivilizationManager {
    
    var delegate : CivilizationManagerDelegate?
   
    var uniqueUnitManager = UniqueUnitManager()

    let url = "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations"
    
    
    func fetchCivilizations() {
             //let localPoke = setUserDef()
             //let requestedUrl = url + String(localPoke) + "/"
             if let url = URL(string: url) {
                 let session = URLSession(configuration: .default)
                 let task = session.dataTask(with: url) { (data, response, error) in
                     if error != nil {
                         print(error!)
                         return
                     }
                     
                     if let safeData = data {
                         if let civilization = parseJSON(aoeData: safeData) {
                             
                             self.delegate?.didUpdateCivilization(civilization: civilization)
                         }
                     }
                 }
                 
                 
                 task.resume()
                 
    }
    }
        
        func parseJSON(aoeData: Data) -> CivilizationModel? {
            let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(civilizationData.self, from: aoeData)
                    let name = decodedData.civilizations[0].name
                    let id = decodedData.civilizations[0].id
                    let army_type = decodedData.civilizations[0].army_type
                    let team_bonus = decodedData.civilizations[0].team_bonus
                    let civi_bonus = decodedData.civilizations[0].civilization_bonus
                    let unique_unit = decodedData.civilizations[0].unique_unit[0]
                                        
                    let civilization = CivilizationModel(name: name, id: id, team_bonus: team_bonus, army_type: army_type, civilization_bonus: civi_bonus, unique_unit: unique_unit)
                    
                    
                    
                    return civilization
                     
                 } catch {
                     print(error)
                     return nil
                     
                 }
        }
}
