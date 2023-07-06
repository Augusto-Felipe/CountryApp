//
//  FavoritesViewController.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 06/07/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var screen: FavoritesViewControllerScreen?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.screen = FavoritesViewControllerScreen()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.screen?.configCollectionView(delegate: self, datasource: self)
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AllCountriesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: AllCountriesCollectionViewCell.identifier, for: indexPath) as? AllCountriesCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: 100)
    }
}
