//
//  CountryDetailViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 26/06/23.
//

import UIKit
import CoreLocation
import WebKit

class CountryDetailViewController: UIViewController {
    
//    var webView: WKWebView?
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
        self.mapService = MapService()
        self.setupCountryDetail()
        self.screen.delegate(delegate: self)
    }
    
    @objc func closeWebView() {
        if let webView = self.view.subviews.first(where: { $0 is WKWebView }) as? WKWebView {
            webView.removeFromSuperview()
        }
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        
        if actionTitle == "Open Street Map" {
            let webView = WKWebView(frame: self.view.bounds)
            guard let url = URL(string: country?.maps?.openStreetMaps ?? "") else { return }
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            self.view.addSubview(webView)
            
            let closeButton = UIButton(type: .system)
            closeButton.setTitle("Fechar", for: .normal)
            closeButton.setTitleColor(.white, for: .normal)
            closeButton.backgroundColor = .appBlue
            closeButton.clipsToBounds = true
            closeButton.layer.cornerRadius = 10
            closeButton.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
            closeButton.frame = CGRect(x: self.view.bounds.width - 66, y: 36, width: 50, height: 30)
            webView.addSubview(closeButton)
            
        } else if actionTitle == "Open Google Maps" {
            let webView = WKWebView(frame: self.view.bounds)
            guard let url = URL(string: country?.maps?.googleMaps ?? "") else { return }
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            self.view.addSubview(webView)
            
            let closeButton = UIButton(type: .system)
            closeButton.setTitle("Fechar", for: .normal)
            closeButton.setTitleColor(.white, for: .normal)
            closeButton.backgroundColor = .appBlue
            closeButton.clipsToBounds = true
            closeButton.layer.cornerRadius = 10
            closeButton.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
            closeButton.frame = CGRect(x: self.view.bounds.width - 66, y: 36, width: 50, height: 30)
            webView.addSubview(closeButton)
        }
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
            self.screen.coatOfArmsImageView.af.setImage(withURL: urlCoatOfArmsImage, placeholderImage: UIImage(named: "threeButtons"))
            self.screen.coatOfArmsImageView.backgroundColor = .white
        } else {
            if let urlFlagImage: URL = URL(string: country?.flags?.png ?? "") {
                self.screen.coatOfArmsImageView.af.setImage(withURL: urlFlagImage, placeholderImage: UIImage(named: "threeButtons"))
                self.screen.coatOfArmsImageView.backgroundColor = .white
            }
        }
        
        if let lat = country?.latlng?[0], let long = country?.latlng?[1] {
            self.mapService?.setLocation(viewController: self, map: self.screen.map, latitude: lat, longitude: long)
        }
    }
}

extension CountryDetailViewController: CountryDetailViewControllerScreenProtocol {
    func openWebMapButtonTapped() {
        print(#function)
        let ac = UIAlertController(title: "Open Page", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Open Street Map", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Open Google Maps", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CountryDetailViewController: CLLocationManagerDelegate {
    
}

//extension CountryDetailViewController: WKNavigationDelegate {
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }
//}
