//
//  ContinentsViewModel.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 02/07/23.
//

import Foundation

protocol ContinentsViewModelProtocol: AnyObject {
    func reloadCollectionView()
}

class ContinentsViewModel {
    
    private var delegate: ContinentsViewModelProtocol?
    private var service: CountryService = CountryService()
    private var countryList: [Country] = []
    private var countryByContinentList: [Country] = []
    
    public func delegate(delegate: ContinentsViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentCountry(indexPath: IndexPath) -> Country {
        return countryByContinentList[indexPath.row]
    }
    
    var numberOfItemsInSection: Int {
        return countryByContinentList.count
    }
    
    public func fetchRequest(indexPath: Int) {
        service.getCountryData { data, error in
            if error != nil {
                
            } else {
                self.countryByContinentList = []
                self.countryList = data ?? []
                
                switch indexPath {
                case 0:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "North America" {
                            self.countryByContinentList.append(country)
                        }
                    }
                case 1:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "South America" {
                            self.countryByContinentList.append(country)
                        }
                    }
                case 2:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "Africa" {
                            self.countryByContinentList.append(country)
                        }
                    }
                case 3:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "Europe" {
                            self.countryByContinentList.append(country)
                        }
                    }
                case 4:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "Oceania" {
                            self.countryByContinentList.append(country)
                        }
                    }
                case 5:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "Asia" {
                            self.countryByContinentList.append(country)
                        }
                    }
                case 6:
                    for country in self.countryList {
                        if country.continents?[0].rawValue == "Antarctica" {
                            self.countryByContinentList.append(country)
                        }
                    }
                default:
                    break
                }
                
                self.delegate?.reloadCollectionView()
    
            }
        }
    }
}


