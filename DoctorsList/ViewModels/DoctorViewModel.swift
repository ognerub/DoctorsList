//
//  DoctorViewModel.swift
//  DoctorsList
//
//  Created by Admin on 3/7/24.
//

import Foundation
import Combine

class DoctorViewModel: ObservableObject {
    
    @Published var doctor: Doctor?
    let service = DoctorsService()
    private var cancellation: AnyCancellable?
    
    func getDoctor(id: Int) {
        cancellation = service.get(id: id)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { responses in
                let user = responses.record.data.users[id]
                let name = user.firstName
                let img = user.avatar
                    let doctor = Doctor(
                        id: id,
                        name: name,
                        img: img)
                    self.doctor = doctor
                
            })
        
    }
}
