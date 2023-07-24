//
//  AllCountriesViewControllerScreen.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

protocol AllCountriesViewControllerScreenProtocol: AnyObject {
    func reloadData()
}

class AllCountriesViewControllerScreen: UIView {
    
    var delegate: AllCountriesViewControllerScreenProtocol?
    
    public func delegate(delegate: AllCountriesViewControllerScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var navigationBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appBlue
        return view
    }()
    
    lazy var reloadInfo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "circles.hexagonpath.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(reloadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var navigationTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lb.text = "Todos os países"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(AllCountriesCollectionViewCell.self, forCellWithReuseIdentifier: AllCountriesCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 24, bottom: 0, right: 24)
        layout.scrollDirection = .vertical
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }()
    
    @objc func reloadButtonTapped() {
        self.delegate?.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configCollectionView(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = datasource
    }
    
    public func addElements() {
        addSubview(navigationBarView)
        navigationBarView.addSubview(navigationTitleLabel)
        navigationBarView.addSubview(reloadInfo)
        addSubview(collectionView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: topAnchor),
            navigationBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 110),
            
            navigationTitleLabel.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor),
            navigationTitleLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor, constant: 20),
            
            reloadInfo.centerYAnchor.constraint(equalTo: navigationTitleLabel.centerYAnchor),
            reloadInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            reloadInfo.heightAnchor.constraint(equalToConstant: 40),
            reloadInfo.widthAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
