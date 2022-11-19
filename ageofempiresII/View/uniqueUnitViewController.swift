//
//  uniqueUnitViewController.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 19.11.2022.
//

import UIKit

class uniqueUnitViewController: UIViewController, UniqueUnitManagerDelegate {
    
    
    var uniqueUnitManager = UniqueUnitManager()
    
    var unitUrl: String?
    
    
    
    private let civilizationName: UILabel = {
        let label = UILabel()
        label.text = "civilizationName"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationDescription: UILabel = {
        let label = UILabel()
        label.text = "civilizationDescription"
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationAge: UILabel = {
        let label = UILabel()
        label.text = "civilizationAge"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationBuildTime: UILabel = {
        let label = UILabel()
        label.text = "civilizationBuildTime"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationHitPoints: UILabel = {
        let label = UILabel()
        label.text = "civilizationHitPoints"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationAttack: UILabel = {
        let label = UILabel()
        label.text = "civilizationAttack"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationAttackBonus: UILabel = {
        let label = UILabel()
        label.text = "civilizationAttackBonus"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        uniqueUnitManager.delegate = self
        
        print("unit url : \(unitUrl)")
        
        uniqueUnitManager.sendRequest(url: unitUrl ?? "")
        
        view.addSubview(civilizationName)
        view.addSubview(civilizationDescription)
        view.addSubview(civilizationAge)
        view.addSubview(civilizationBuildTime)
        view.addSubview(civilizationAttack)
        view.addSubview(civilizationAttackBonus)
        
        applyConstraint()

        // Do any additional setup after loading the view.
    }
    
    func didUpdateUniqueUnit(uniqueUnit: UniqueUnitModel) {
        DispatchQueue.main.async {
            self.civilizationName.text = uniqueUnit.name
            self.civilizationDescription.text = uniqueUnit.description
            self.civilizationAge.text = uniqueUnit.age
            self.civilizationBuildTime.text = String(uniqueUnit.build_time)
            self.civilizationHitPoints.text = String(uniqueUnit.hit_points)
            self.civilizationAttack.text = String(uniqueUnit.attack)
            //self.civilizationAttackBonus.text = String(uniqueUnit.attack_bonus)
        }
    }
    
    func applyConstraint() {
        
        let civiNameConst = [
            civilizationName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 182),
            civilizationName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            civilizationName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            civilizationName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30)
        ]
        
        NSLayoutConstraint.activate(civiNameConst)
        let civiDescConst = [
            civilizationDescription.topAnchor.constraint(equalTo: civilizationName.bottomAnchor, constant: 30),
            civilizationDescription.centerXAnchor.constraint(equalTo: civilizationName.centerXAnchor),
            civilizationDescription.trailingAnchor.constraint(equalTo: civilizationName.trailingAnchor, constant: 0),
            civilizationDescription.leadingAnchor.constraint(equalTo: civilizationName.leadingAnchor, constant: 0)
        ]
        
        NSLayoutConstraint.activate(civiDescConst)
        
        let civiAgeConst = [
            civilizationAge.topAnchor.constraint(equalTo: civilizationDescription.bottomAnchor, constant: 30),
            civilizationAge.centerXAnchor.constraint(equalTo: civilizationDescription.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(civiAgeConst)
        
        let civiBuildTimeConst = [
            civilizationBuildTime.topAnchor.constraint(equalTo: civilizationAge.bottomAnchor, constant: 30),
            civilizationBuildTime.centerXAnchor.constraint(equalTo: civilizationAge.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(civiBuildTimeConst)
        
        let civiAttackConst = [
            civilizationAttack.topAnchor.constraint(equalTo: civilizationBuildTime.bottomAnchor, constant: 30),
            civilizationAttack.centerXAnchor.constraint(equalTo: civilizationBuildTime.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(civiAttackConst)
        
        let civiAttackBonusConst = [
            civilizationAttackBonus.topAnchor.constraint(equalTo: civilizationAttack.bottomAnchor, constant: 30),
            civilizationAttackBonus.centerXAnchor.constraint(equalTo: civilizationAttack.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(civiAttackBonusConst)
    }
}
