//
//  CountriesByContinentCollectionViewCell.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class CountriesByContinentCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: CountriesByContinentCollectionViewCell.self)
    
    lazy var screen: CountriesByContinentCollectionViewCellScreen = {
        let screen = CountriesByContinentCollectionViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addElements() {
        contentView.addSubview(screen)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(continentName: String) {
        self.screen.continentLabel.text  = continentName
    }
}
