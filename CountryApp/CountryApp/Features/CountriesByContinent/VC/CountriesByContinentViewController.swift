//
//  CountriesByContinentViewController.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 01/07/23.
//

import UIKit

class CountriesByContinentViewController: UIViewController {

    var screen: CountriesByContinentViewControllerScreen?
    var viewModel: CountriesByContinentViewModel = CountriesByContinentViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.screen = CountriesByContinentViewControllerScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.viewModel.fetchRequest()
        self.viewModel.delegate(delegate: self)
        self.screen?.delegate(delegate: self)
        self.screen?.configCollectionView(delegate: self, datasource: self)
    }
}

extension CountriesByContinentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CountriesByContinentCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: CountriesByContinentCollectionViewCell.identifier, for: indexPath) as? CountriesByContinentCollectionViewCell
        cell?.setupCell(country: viewModel.loadCurrentCountry(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = CountryDetailViewController(country: viewModel.loadCurrentImage(indexPath: indexPath))
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CountriesByContinentViewController: CountriesByContinentViewControllerScreenProtocol {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CountriesByContinentViewController: CountriesByContinentViewModelProtocol {
    func reloadCollectionView() {
        self.screen?.collectionView.reloadData()
    }
}
