//
//  ViewController.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 18.09.2022.
//

import UIKit

class mainPageViewController: UIViewController, CivilizationManagerDelegate {
    
    var items: [Item] = []
    
    var getCivi: CivilizationModel?
    
    
    var civilizationManager = CivilizationManager()
    
    var unitSendUrl: String?
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 10
        static let itemHeight: CGFloat = 80
    }
    
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
    
    private let uniqueUnitButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("Unique Unit", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
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
        
        view.addSubview(uniqueUnitButton)
        
        infoView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        
        
        
        uniqueUnitButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        // Do any additional setup after loading the view.
        
        applyConstraint()
    }
    
    private func getItems(model: CivilizationModel) {
        
        print("modelll: \(model)")
        
        
        
        items = [
            Item(title: "Army TYPE", desc: model.army_type),
            Item(title: "TEAM BONUS", desc: model.team_bonus),
            Item(title: "CIVILIZATION BONUS", desc: model.civilization_bonus[0])
        ]
        
        
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        
        let signUpViewController = uniqueUnitViewController()
        signUpViewController.unitUrl = unitSendUrl
        
        present(signUpViewController, animated: true, completion: nil)
        
    }
    
    func didUpdateCivilization(civilization: CivilizationModel) {
        
        DispatchQueue.main.async {
            self.civilizationName.text = civilization.name
            self.civilizationTeamBonus.text = civilization.team_bonus
            self.civilizationArmyType.text = civilization.army_type
            self.unitSendUrl = civilization.unique_unit
            //self.uniqueUnitManager.sendRequest(url: civilization.unique_unit)
            
            let getCivi2 = CivilizationModel(name: civilization.name, id: civilization.id, team_bonus: civilization.team_bonus, army_type: civilization.army_type, civilization_bonus: civilization.civilization_bonus, unique_unit: "")
            
            self.getItems(model: getCivi2)
            
            self.collectionView.reloadData()
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
        
        let collectionViewConst = [
            collectionView.topAnchor.constraint(equalTo: civilizationArmyType.bottomAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: infoView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: infoView.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(collectionViewConst)
        
        let unitButtonConst = [
            uniqueUnitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            uniqueUnitButton.centerXAnchor.constraint(equalTo: infoView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(unitButtonConst)
        
    }
}

extension mainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        
        let item = items[indexPath.row]
        cell.setup(with: item)
        cell.contentView.backgroundColor = .darkGray
        return cell
    }
}

extension mainPageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: 0)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}

