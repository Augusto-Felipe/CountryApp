//
//  FavoritesViewController.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 06/07/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var screen: FavoritesViewControllerScreen?
    var viewModel: FavoritesViewModel = FavoritesViewModel()
    private var countryManager: CountryManager = CountryManager()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        viewModel.fetchFavoriteCountryList()
    }
    
    override func loadView() {
        self.screen = FavoritesViewControllerScreen()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.viewModel.delegate(delegate: self)
        self.screen?.configCollectionView(delegate: self, datasource: self)
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoritesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.identifier, for: indexPath) as? FavoritesCollectionViewCell
        cell?.setupCell(country: viewModel.loadCurrentCountry(indexPath: indexPath))
        cell?.deleteFavorite = { [weak self] in
            guard let object = self?.viewModel.loadCurrentCountry(indexPath: indexPath) else { return }
            self?.countryManager.deleteItem(country: object) { success in
                if success {
                    self?.viewModel.fetchFavoriteCountryList()
                    self?.screen?.collectionView.reloadData()
                } else {
                    
                }
            }
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: 100)
    }
}

extension FavoritesViewController: FavoritesViewModelProtocol {
    func reloadCollectionView() {
        self.screen?.collectionView.reloadData()
    }
}
