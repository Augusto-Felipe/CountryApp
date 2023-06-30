//
//  CountryDetailViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 26/06/23.
//

import UIKit
import CoreLocation

class CountryDetailViewController: UIViewController {
    
    var country: Country?
    var mapService: MapService?
    
    init(country: Country) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        self.screen.scrollView.frame = self.view.bounds;
        self.screen.scrollView.contentSize.height = 3000;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var screen: CountryDetailViewControllerScreen = {
        let screen = CountryDetailViewControllerScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override func loadView() {
        self.screen = CountryDetailViewControllerScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cellColor
        self.setupCountryDetail()
        self.mapService = MapService()
        #warning("Continue map configuration")
        self.screen.delegate(delegate: self)
    }
    
    public func setupCountryDetail() {
        self.screen.countryNameLabel.text = country?.name?.official
        
        if let urlFlagImage: URL = URL(string: country?.flags?.png ?? "") {
            self.screen.countryFlagImageView.af.setImage(withURL: urlFlagImage)
            self.screen.countryFlagImageView.backgroundColor = .white
        }
        
        if let currencies = country?.currencies {
            let mirror = Mirror(reflecting: currencies)
            for child in mirror.children {
                if let currency = child.value as? Aed {
                    if let currencyName = currency.name, let currencySymbol = currency.symbol {
                        self.screen.currencyLabel.text = currencyName
                        self.screen.currencySymbolLabel.text = currencySymbol
                    }
                } else if child.value is BAM {
                    self.screen.currencyLabel.text = "Erro"
                }
            }
        }
        
        if let countryCapital = country?.capital?[0] {
            self.screen.capitalLabel.text = countryCapital
        } else {
            self.screen.capitalLabel.text = "Erro"
        }
        
        if let ptTranslation = country?.translations?["por"]?.official {
            self.screen.altSpellingLabel.text = ptTranslation
        }
        
        if let continent = country?.continents?[0].rawValue {
            self.screen.continentLabel.text = continent
        }
        
        if let urlCoatOfArmsImage: URL = URL(string: country?.coatOfArms?.png ?? "") {
            self.screen.coatOfArmsImageView.af.setImage(withURL: urlCoatOfArmsImage)
            self.screen.coatOfArmsImageView.backgroundColor = .white
        } else {
            if let urlFlagImage: URL = URL(string: country?.flags?.png ?? "") {
                self.screen.coatOfArmsImageView.af.setImage(withURL: urlFlagImage)
                self.screen.coatOfArmsImageView.backgroundColor = .white
            }
        }
        
    }
}

extension CountryDetailViewController: CountryDetailViewControllerScreenProtocol {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CountryDetailViewController: CLLocationManagerDelegate {
    
}
