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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addElements() {
        addSubview(cardView)
        cardView.addSubview(countryFlagImageView)
        cardView.addSubview(countryNameLabel)
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
        ])
    }
}
