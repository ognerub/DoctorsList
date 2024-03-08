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
                let doctorById = responses.record.data.users[id]
                let name = doctorById.firstName
                    let doctor = Doctor(
                        id: id,
                        name: name)
                    self.doctor = doctor
                
            })
        
    }
}
