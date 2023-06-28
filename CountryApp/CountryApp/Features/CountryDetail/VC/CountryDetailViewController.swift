//
//  CountryDetailViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 26/06/23.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var country: Country?
    
    init(country: Country) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
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
        self.screen.delegate(delegate: self)
    }
    
    public func setupCountryDetail() {
        self.screen.countryNameLabel.text = country?.name?.official
    }
}

extension CountryDetailViewController: CountryDetailViewControllerScreenProtocol {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
