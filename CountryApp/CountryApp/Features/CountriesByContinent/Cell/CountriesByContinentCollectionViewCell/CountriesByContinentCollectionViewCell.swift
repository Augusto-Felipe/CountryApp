//
//  CountriesByContinentCollectionViewCell.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 01/07/23.
//

import UIKit

class CountriesByContinentCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: CountriesByContinentCollectionViewCell.self)
    
    lazy var screen: AllCountriesCollectionViewCellScreen = {
        let screen = AllCountriesCollectionViewCellScreen()
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
    
    public func setupCell(country: Country) {
        if let urlFlagImage: URL = URL(string: country.flags?.png ?? "") {
            screen.countryFlagImageView.af.setImage(withURL: urlFlagImage)
            screen.countryFlagImageView.backgroundColor = .white
        }
        screen.countryNameLabel.text = country.name?.common
    }
}
