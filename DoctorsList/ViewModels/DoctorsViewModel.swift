//
//  DoctorsViewModel.swift
//  DoctorsList
//
//  Created by Ognerub on 3/6/24.
//

import Foundation
import Combine

final class DoctorsViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    
    private var cancellation: AnyCancellable?
    private let service = DoctorsService()
    
    init() {
        fetchDoctors()
    }
    
    func fetchDoctors() {
        cancellation = service.fetch()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { responses in
                var doctors: [Doctor] = []
                responses.record.data.users.enumerated().forEach({ (index,user) in
                    let doctor = Doctor(
                        id: index,
                        name: user.firstName,
                        img: user.avatar)
                    doctors.append(doctor)
                })
                self.doctors = doctors
            })
        
    }
}
