//
//  AllCountriesCollectionViewCell.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit
import AlamofireImage

class AllCountriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: AllCountriesCollectionViewCell.self)
    public var saveFavorite: (() -> Void)?

    lazy var screen: AllCountriesCollectionViewCellScreen = {
        let screen = AllCountriesCollectionViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        screen.delegate(delegate: self)
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
    
    public func isFavoriteTapped() -> Bool {
        if let currentImage = screen.favoriteButton.currentImage {
            let desiredImage = UIImage(systemName: "star")
            let isImageEqual = currentImage.isEqual(desiredImage)
            
            if isImageEqual {
                screen.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
                return true
            } else {
                screen.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
                return false
            }
        } else {
            return false
        }
    }
}

extension AllCountriesCollectionViewCell: AllCountriesCollectionViewCellScreenProtocol {
    func favoriteButtonTapped() {
        if isFavoriteTapped() {
            saveFavorite?()
        } else {
            
        }
    }
}
