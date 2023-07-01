//
//  CountriesByContinentViewController.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import UIKit

class ContinentsViewController: UIViewController {
    
    var screen: ContinentsViewControllerScreen?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.screen = ContinentsViewControllerScreen()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.screen?.configCollectionView(delegate: self, datasource: self)
    }
}

extension ContinentsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ContinentCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: ContinentCollectionViewCell.identifier, for: indexPath) as? ContinentCollectionViewCell
        
        if indexPath.row == 0 {
            cell?.setupCell(continentName: "América")
        } else if indexPath.row == 1 {
            cell?.setupCell(continentName: "Ásia")
        } else if indexPath.row == 2 {
            cell?.setupCell(continentName: "África")
        } else if indexPath.row == 3 {
            cell?.setupCell(continentName: "Europa")
        } else if indexPath.row == 4 {
            cell?.setupCell(continentName: "Antártica")
        } else {
            cell?.setupCell(continentName: "Oceania")
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CountriesByContinentViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
