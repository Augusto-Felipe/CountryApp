//
//  FavoritesCollectionViewCell.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 18/07/23.
//

import UIKit
import AlamofireImage

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: FavoritesCollectionViewCell.self)
    
    lazy var screen: FavoritesCollectionViewCellScreen = {
        let screen = FavoritesCollectionViewCellScreen()
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
    
    public func setupCell(country: CountryEntity) {
        self.screen.countryNameLabel.text = country.name
        if let urlFlagImage: URL = URL(string: country.image ?? "") {
            screen.countryFlagImageView.af.setImage(withURL: urlFlagImage)
            screen.countryFlagImageView.backgroundColor = .white
        }
    }
    
}
