//
//  FavoritesViewModel.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 18/07/23.
//

import Foundation

protocol FavoritesViewModelProtocol: AnyObject {
    func reloadCollectionView()
}

class FavoritesViewModel {
    
    private var favoriteCountryList: [CountryEntity] = []
    private var countryManager: CountryManager = CountryManager()
    private var delegate: FavoritesViewModelProtocol?
    
    public func delegate(delegate: FavoritesViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func fetchFavoriteCountryList() {
        self.favoriteCountryList = countryManager.getItems
        self.delegate?.reloadCollectionView()
    }
    
    public func loadCurrentCountry(indexPath: IndexPath) -> CountryEntity {
        return favoriteCountryList[indexPath.row]
    }
    
    public var numberOfItemsInSection: Int {
        return favoriteCountryList.count
    }
}

