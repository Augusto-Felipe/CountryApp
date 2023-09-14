//
//  CountryService.swift
//  FlagsApp
//
//  Created by Felipe Augusto Correia on 25/06/23.
//

import Foundation
import Alamofire

class CountryService {
    
    func getCountryData(completion: @escaping ([Country]?, Error?) -> Void) {
        
        let url: String = "https://restcountries.com/v3.1/all"
        
        AF.request(url, method: .get).validate().responseDecodable(of: [Country].self) { response in
            
            switch response.result {
            case .success(let sucess):
                print("SUCESS -> \(#function)")
                completion(sucess, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, error)
            }
        }
    }
}
