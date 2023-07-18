//
//  FavoritesViewModel.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 18/07/23.
//

import Foundation

class FavoritesViewModel {
    
    var favoriteCountryList: [CountryEntity] = []
    var countryManager: CountryManager = CountryManager()
    
    public func fetchFavoriteCountryList() {
        favoriteCountryList = countryManager.getItems 
    }
    
    public func loadCurrentCounttry(indexPath: IndexPath) -> CountryEntity {
        return favoriteCountryList[indexPath.row]
    }
    
    public var numberOfItemsInSection: Int {
        return favoriteCountryList.count
    }
    
}
