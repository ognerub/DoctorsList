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
    private let service = DoctorsService()
    private var cancellation: AnyCancellable?
    
    func getDoctor(id: UUID?) {
        cancellation = service.fetch()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { responses in
                let users = responses.record.data.users.filter( {
                    UUID(uuidString: $0.id) == id
                })
                guard let user = users.first else { return }
                guard let id = UUID(uuidString: user.id) else { return }
                let name = user.firstName
                let img = user.avatar
                let doctor = Doctor(
                    id: id,
                    name: name,
                    patronymic: user.patronymic,
                    lastName: user.lastName,
                    img: img)
                self.doctor = doctor
                
            })
    }
}
