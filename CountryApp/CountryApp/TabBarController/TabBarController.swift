//
//  ViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    private func setupTabBarController() {
        let allCountriesVC = UINavigationController(rootViewController: AllCountriesViewController())
        let countriesByContinentVC = UINavigationController(rootViewController: ContinentsViewController())
        let searchCountryVC = UINavigationController(rootViewController: SearchCountryViewController())
        let favoriteCountriesVC = UINavigationController(rootViewController: FavoritesViewController())
        self.setViewControllers([allCountriesVC, countriesByContinentVC ,searchCountryVC, favoriteCountriesVC], animated: false)
        self.tabBar.backgroundColor = .appBlue
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(red: 175/255, green: 211/255, blue: 226/255, alpha: 1.0)
        self.tabBar.unselectedItemTintColor = .white
        
        guard let items = tabBar.items else { return }
        items[0].title = "Todos"
        items[0].image = UIImage(systemName: "flag")
        
        items[1].title = "Por continente"
        items[1].image = UIImage(systemName: "square.3.stack.3d.top.fill")
        
        items[2].title = "Buscar"
        items[2].image = UIImage(systemName: "magnifyingglass")
        
        items[3].title = "Favoritos"
        items[3].image = UIImage(systemName: "star")
    }
}


