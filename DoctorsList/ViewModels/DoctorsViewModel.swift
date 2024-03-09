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
                    guard let id = UUID(uuidString: user.id) else { return }
                    let doctor = Doctor(
                        id: id,
                        name: user.firstName,
                        patronymic: user.patronymic,
                        lastName: user.lastName,
                        img: user.avatar)
                    doctors.append(doctor)
                })
                self.doctors = doctors
            })
        
    }
}
