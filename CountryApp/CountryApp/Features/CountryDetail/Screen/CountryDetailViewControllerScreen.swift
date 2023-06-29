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
    
    lazy var countryNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
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
    
    lazy var detailView: UIView = {
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
    
    lazy var flagCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cellColor
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 8
        view.layer.shouldRasterize = true
        view.layer.masksToBounds = false
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    lazy var capitalTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = UIColor.lightGray
        lb.text = "Capital"
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var capitalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .cellColor
        return view
    }()
    
    lazy var capitalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lb.textColor = UIColor.appBlue
        lb.text = "Teste"
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var currencyTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = UIColor.lightGray
        lb.text = "Moeda"
        lb.textAlignment = .center
        return lb
    }()
    
    let stackView:UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    lazy var currencyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .cellColor
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    lazy var currencyLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lb.textColor = UIColor.appBlue
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var currencySymbolView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.backgroundColor = .cellColor
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    lazy var currencySymbolLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lb.textColor = UIColor.appBlue
        lb.textAlignment = .center
        return lb
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
        addSubview(detailView)
        detailView.addSubview(flagCardView)
        detailView.addSubview(scrollView)
        navigationBarView.addSubview(backButton)
        navigationBarView.addSubview(countryNameLabel)
        addSubview(countryFlagImageView)
        scrollView.addSubview(capitalTitleLabel)
        scrollView.addSubview(capitalView)
        capitalView.addSubview(capitalLabel)
        scrollView.addSubview(currencyTitleLabel)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(currencyView)
        stackView.addArrangedSubview(currencySymbolView)
        currencyView.addSubview(currencyLabel)
        currencySymbolView.addSubview(currencySymbolLabel)
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
            
            detailView.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 20),
            detailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            detailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            detailView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            flagCardView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 25),
            flagCardView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 40),
            flagCardView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -40),
            flagCardView.heightAnchor.constraint(equalToConstant: 150),
            
            countryFlagImageView.topAnchor.constraint(equalTo: flagCardView.topAnchor),
            countryFlagImageView.leadingAnchor.constraint(equalTo: flagCardView.leadingAnchor),
            countryFlagImageView.trailingAnchor.constraint(equalTo: flagCardView.trailingAnchor),
            countryFlagImageView.bottomAnchor.constraint(equalTo: flagCardView.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: flagCardView.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: flagCardView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: flagCardView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor),
            
            capitalTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            capitalTitleLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            
            capitalView.topAnchor.constraint(equalTo: capitalTitleLabel.bottomAnchor, constant: 10),
            capitalView.leadingAnchor.constraint(equalTo: capitalTitleLabel.leadingAnchor),
            capitalView.trailingAnchor.constraint(equalTo: capitalTitleLabel.trailingAnchor),
            capitalView.heightAnchor.constraint(equalToConstant: 50),
            
            capitalLabel.centerYAnchor.constraint(equalTo: capitalView.centerYAnchor),
            capitalLabel.leadingAnchor.constraint(equalTo: capitalView.leadingAnchor, constant: 10),
            capitalLabel.trailingAnchor.constraint(equalTo: capitalView.trailingAnchor, constant: -10),
            
            currencyTitleLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            currencyTitleLabel.topAnchor.constraint(equalTo: capitalView.bottomAnchor, constant: 10),
            
            stackView.topAnchor.constraint(equalTo: currencyTitleLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: flagCardView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: flagCardView.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            currencyLabel.centerYAnchor.constraint(equalTo: currencyView.centerYAnchor),
            currencyLabel.leadingAnchor.constraint(equalTo: currencyView.leadingAnchor, constant: 10),
            currencyLabel.trailingAnchor.constraint(equalTo: currencyView.trailingAnchor, constant: -10),
            
            currencySymbolLabel.centerYAnchor.constraint(equalTo: currencySymbolView.centerYAnchor),
            currencySymbolLabel.centerXAnchor.constraint(equalTo: currencySymbolView.centerXAnchor),
            currencySymbolLabel.leadingAnchor.constraint(equalTo: currencySymbolView.leadingAnchor, constant: 20),
            currencySymbolView.trailingAnchor.constraint(equalTo: currencySymbolView.trailingAnchor, constant: -20),
        ])
    }
}
