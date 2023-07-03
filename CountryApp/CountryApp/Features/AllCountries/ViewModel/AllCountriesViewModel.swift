//
//  AllCountriesViewModel.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import Foundation

protocol AllCountriesViewModelProtocol: AnyObject {
    func reloadCollectionView()
}

class AllCountriesViewModel {
    
    private var delegate: AllCountriesViewModelProtocol?
    private var service: CountryService = CountryService()
    private var countryList: [Country] = []
    
    public func delegate(delegate: AllCountriesViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentCountry(indexPath: IndexPath) -> Country {
        return countryList[indexPath.row]
    }
    
    var numberOfItemsInSection: Int {
        return countryList.count
    }
    
    public func fetchRequest() {
        service.getCountryData { data, error in
            if error != nil {
                
            } else {
                self.countryList = data ?? []
                self.delegate?.reloadCollectionView()
            }
        }
    }
}
