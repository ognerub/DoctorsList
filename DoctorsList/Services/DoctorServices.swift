//
//  DoctorServices.swift
//  DoctorsList
//
//  Created by Ognerub on 3/7/24.
//

import Foundation
import Alamofire
import Combine

final class DoctorsService {
    let url = "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4"
    

    func fetch() -> AnyPublisher<ApiResponse, AFError> {
        let publisher = AF.request(url).publishDecodable(type: ApiResponse.self)
        return publisher.value()
    }
    
    func get(id: Int) -> AnyPublisher<ApiResponse, AFError> {
        let publisher = AF.request(url).publishDecodable(type: ApiResponse.self)
        return publisher.value()
    }
}

