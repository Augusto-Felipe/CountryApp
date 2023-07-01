//
//  CountriesByContinentCollectionViewCellScreen.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class ContinentCollectionViewCellScreen: UIView {

    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .cellColor
        view.setCardShadow()
        return view
    }()
    
    lazy var continentLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = .appBlue
        lb.textAlignment = .center
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
        cardView.addSubview(continentLabel)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            
            continentLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 25),
            continentLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
        ])
    }
}
