//
//  ViewController.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 18.09.2022.
//

import UIKit

class mainPageViewController: UIViewController, CivilizationManagerDelegate {
    
    var civilizationManager = CivilizationManager()
    
    private let infoView: UIView = {
       
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private let civilizationName: UILabel = {
       
        let label = UILabel()
        
        label.text = "civilizationName"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    private let civilizationTeamBonusName: UILabel = {
       
        let label = UILabel()
        
        label.text = "Civilization Team Bonus"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationTeamBonus: UILabel = {
       
        let label = UILabel()
        
        label.text = "civilizationTeamBonus"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationArmyTypeName: UILabel = {
       
        let label = UILabel()
        
        label.text = "Civilization Army Type"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let civilizationArmyType: UILabel = {
       
        let label = UILabel()
        
        label.text = "civilizationTeamBonus"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let aoeImgView: UIImageView = {
       
        let image = UIImageView()
        image.image = UIImage(named: "aeoImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        civilizationManager.delegate = self
        
        civilizationManager.fetchCivilizations()
        
        view.addSubview(infoView)
        infoView.addSubview(civilizationName)
        infoView.addSubview(civilizationTeamBonusName)
        infoView.addSubview(civilizationTeamBonus)
        infoView.addSubview(aoeImgView)
        infoView.addSubview(civilizationArmyTypeName)
        infoView.addSubview(civilizationArmyType)
        
        // Do any additional setup after loading the view.
        
        applyConstraint()
    }
    
    func didUpdateCivilization(civilization: CivilizationModel) {
        
        DispatchQueue.main.async {
            self.civilizationName.text = civilization.name
            self.civilizationTeamBonus.text = civilization.team_bonus
            self.civilizationArmyType.text = civilization.army_type
        }
    }

    
    func applyConstraint(){
        
        let infoViewConst = [
            infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 182),
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 520),
            infoView.widthAnchor.constraint(equalToConstant: 350)
        ]
        
        NSLayoutConstraint.activate(infoViewConst)
        
        let aoeImgViewConst = [
            aoeImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            aoeImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aoeImgView.heightAnchor.constraint(equalToConstant: 200),
            aoeImgView.widthAnchor.constraint(equalToConstant: 280)
        ]
        
        NSLayoutConstraint.activate(aoeImgViewConst)
        
        
        let civilizationNameConst = [
            civilizationName.topAnchor.constraint(equalTo: aoeImgView.bottomAnchor, constant: 18),
            civilizationName.centerXAnchor.constraint(equalTo: aoeImgView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(civilizationNameConst)
        
        
        let civilizationTeamBonusNameConst = [
            civilizationTeamBonusName.topAnchor.constraint(equalTo: civilizationName.bottomAnchor, constant: 30),
            civilizationTeamBonusName.centerXAnchor.constraint(equalTo: civilizationName.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(civilizationTeamBonusNameConst)
        
        let civilizationTeamBonusConst = [
            civilizationTeamBonus.topAnchor.constraint(equalTo: civilizationTeamBonusName.bottomAnchor, constant: 5),
            civilizationTeamBonus.centerXAnchor.constraint(equalTo: civilizationTeamBonusName.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(civilizationTeamBonusConst)
        
        
        let civilizationArmyTypeNameConst = [
            civilizationArmyTypeName.topAnchor.constraint(equalTo: civilizationTeamBonus.bottomAnchor, constant: 30),
            civilizationArmyTypeName.centerXAnchor.constraint(equalTo: civilizationTeamBonus.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(civilizationArmyTypeNameConst)
        
        let civilizationArmyTypeConst = [
            civilizationArmyType.topAnchor.constraint(equalTo: civilizationArmyTypeName.bottomAnchor, constant: 5),
            civilizationArmyType.centerXAnchor.constraint(equalTo: civilizationArmyTypeName.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(civilizationArmyTypeConst)
        
    }
    

}

