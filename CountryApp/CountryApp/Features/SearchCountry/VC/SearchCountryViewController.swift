//
//  SearchCountryViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class SearchCountryViewController: UIViewController {
    
    var screen: SearchCountryViewControllerScreen?
    var viewModel: SearchCountryViewModel = SearchCountryViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.screen = SearchCountryViewControllerScreen()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        self.viewModel.delegate(delegate: self)
        self.screen?.textFieldDelegate(delegate: self)
        viewModel.fetchRequest()
    }
}

extension SearchCountryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchCountryCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCountryCollectionViewCell.identifier, for: indexPath) as? SearchCountryCollectionViewCell
        cell?.setupCell(country: viewModel.loadCurrentCountry(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: 100)
    }
}

extension SearchCountryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let inputText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return false }
        viewModel.searchCountry(with: inputText)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SearchCountryViewController: SearchCountryViewModelProtocol {
    func sucess() {
        self.screen?.configCollectionView(delegate: self, datasource: self)
    }
    
    func reloadCollectionView() {
        self.screen?.collectionView.reloadData()
    }
}
