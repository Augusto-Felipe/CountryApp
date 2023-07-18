//
//  AllCountriesCollectionViewCellScreen.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class AllCountriesCollectionViewCellScreen: UIView {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .cellColor
        view.setCardShadow()
        return view
    }()
    
    lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.borderColor = UIColor.appBlue.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    lazy var countryNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = .appBlue
        lb.textAlignment = .left
        lb.numberOfLines = 0
        return lb
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .appBlue
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func favoriteButtonTapped() {
        if isFavoriteTapped() {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            #warning("salvar favorito")
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            #warning("excluir favorito")
        }
    }
    
    public func isFavoriteTapped() -> Bool {
        if let currentImage = favoriteButton.currentImage {
            let desiredImage = UIImage(systemName: "star")
            let isImageEqual = currentImage.isEqual(desiredImage)
            
            if isImageEqual {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    public func addElements() {
        addSubview(cardView)
        cardView.addSubview(countryFlagImageView)
        cardView.addSubview(countryNameLabel)
        cardView.addSubview(favoriteButton)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            
            countryFlagImageView.widthAnchor.constraint(equalToConstant: 80),
            countryFlagImageView.heightAnchor.constraint(equalToConstant: 80),
            countryFlagImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            countryFlagImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            
            countryNameLabel.leadingAnchor.constraint(equalTo: countryFlagImageView.trailingAnchor, constant: 20),
            countryNameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            countryNameLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
