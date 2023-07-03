//
//  SearchCountryViewModel.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 03/07/23.
//

protocol SearchCountryViewModelProtocol: AnyObject {
    func sucess()
    func reloadCollectionView()
}

import Foundation

class SearchCountryViewModel {
    
    private var service: CountryService = CountryService()
    private var countryList: [Country] = []
    private var searchCountryList: [Country] = []
    private weak var delegate: SearchCountryViewModelProtocol?
    
    public func delegate(delegate: SearchCountryViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentCountry(indexPath: IndexPath) -> Country {
        return searchCountryList[indexPath.row]
    }
    
    var numberOfItemsInSection: Int {
        return searchCountryList.count
    }
    
    public func searchCountry(with searchText: String) {
        if searchText.isEmpty {
            searchCountryList = countryList
        } else {
            searchCountryList = countryList.filter { ($0.name?.common?.lowercased() ?? "").hasPrefix(searchText.lowercased()) }
        }
        
        self.delegate?.reloadCollectionView()
    }
    
    public func fetchRequest() {
        service.getCountryData { data, error in
            if error != nil {
                
            } else {
                self.countryList = data ?? []
                self.searchCountryList = self.countryList
                self.delegate?.sucess()
            }
        }
    }
}
