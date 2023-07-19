//
//  AllCountriesViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class AllCountriesViewController: UIViewController {
    
    var screen: AllCountriesViewControllerScreen?
    var viewModel: AllCountriesViewModel = AllCountriesViewModel()
    private var countryManager: CountryManager = CountryManager()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.screen = AllCountriesViewControllerScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.screen?.configCollectionView(delegate: self, datasource: self)
        self.viewModel.delegate(delegate: self)
        self.viewModel.fetchRequest()
    }
    
}

extension AllCountriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AllCountriesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: AllCountriesCollectionViewCell.identifier, for: indexPath) as? AllCountriesCollectionViewCell
        cell?.setupCell(country: viewModel.loadCurrentCountry(indexPath: indexPath))
        cell?.saveFavorite = { [weak self] in
            guard let objeto = self?.viewModel.loadCurrentCountry(indexPath: indexPath) else { return }
            self?.countryManager.appendItem(country: objeto) { sucess in
                if sucess {
                    print("objeto salvo")
                    print(objeto)
                } else {
                    print("deu ruim")
                }
            }
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CountryDetailViewController(country: viewModel.loadCurrentCountry(indexPath: indexPath))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AllCountriesViewController: AllCountriesViewModelProtocol {
    func reloadCollectionView() {
        self.screen?.collectionView.reloadData()
    }
}

