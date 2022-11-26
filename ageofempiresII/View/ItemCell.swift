//
//  ItemCell.swift
//  ageofempiresII
//
//  Created by Dilara Şimşek on 23.11.2022.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class ItemCell: UICollectionViewCell {
    
    private enum Constants {
        static let contentViewCornerRadius: CGFloat = 4.0

        static let imageHeight: CGFloat = 20

        static let verticalSpacing: CGFloat = 3.0
        static let horizontalPadding: CGFloat = 8.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
    }
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.backgroundColor = .brown
        label.layer.cornerRadius = 8
        label.textAlignment = .center
        return label
    }()
    
    let desc: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white

        contentView.addSubview(title)
        contentView.addSubview(desc)
    }
    
    private func setupLayouts() {
        title.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            title.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            desc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            desc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            desc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2.0),
            desc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.profileDescriptionVerticalPadding)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setup(with item: Item) {
        title.text = item.title
        desc.text = item.desc
    }
    
}

extension ItemCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
