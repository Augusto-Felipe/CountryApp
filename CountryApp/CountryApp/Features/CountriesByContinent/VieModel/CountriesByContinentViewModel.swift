//
//  CountriesByContinentViewModel.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 01/07/23.
//

import Foundation

protocol CountriesByContinentViewModelProtocol: AnyObject {
    func reloadCollectionView()
}

class CountriesByContinentViewModel {
    
    private var delegate: CountriesByContinentViewModelProtocol?
    private var service: CountryService = CountryService()
    private var countryList: [Country] = []
    private var northAmericaList: [Country] = []
    private var searchCountryList: [Country] = []
    
    public func delegate(delegate: CountriesByContinentViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentCountry(indexPath: IndexPath) -> Country {
        return northAmericaList[indexPath.row]
    }
    
    var numberOfItemsInSection: Int {
        return northAmericaList.count
    }
    
    public func fetchRequest() {
        service.getCountryData { data, error in
            if error != nil {
                
            } else {
                self.countryList = data ?? []
                self.searchCountryList = data ?? []
                
                for country in self.countryList {
                    if country.continents?[0].rawValue == "North America" {
                        self.northAmericaList.append(country)
                    }
                }
                self.delegate?.reloadCollectionView()
            }
        }
    }
}
