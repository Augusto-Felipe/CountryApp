//
//  CountryDetailViewControllerScreen.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 26/06/23.
//

import UIKit

protocol CountryDetailViewControllerScreenProtocol: AnyObject {
    func backButtonTapped()
}

class CountryDetailViewControllerScreen: UIView {
    
    var delegate: CountryDetailViewControllerScreenProtocol?
    
    public func delegate(delegate: CountryDetailViewControllerScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var countryNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    
    lazy var navigationBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appBlue
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    @objc public func backButtonTapped() {
        self.delegate?.backButtonTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addElements() {
        addSubview(navigationBarView)
        addSubview(view)
        navigationBarView.addSubview(backButton)
        navigationBarView.addSubview(countryNameLabel)
        addSubview(countryFlagImageView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: topAnchor),
            navigationBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 250),
            
            backButton.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor, constant: 10),
            backButton.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor, constant: -50),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            countryNameLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: -20),
            countryNameLabel.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor, constant: -10),
            
            countryFlagImageView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 20),
            countryFlagImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            countryFlagImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            countryFlagImageView.heightAnchor.constraint(equalToConstant: 220),
            
            view.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
