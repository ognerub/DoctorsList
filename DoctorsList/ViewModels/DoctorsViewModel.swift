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
                        img: user.avatar,
                        rating: user.ratingsRating,
                        specialization: user.specialization.count > 0 ? user.specialization[0].name : "Терапевт",
                        workExpirience: String(Int.random(in: 1...30)),
                        price: "от \((user.textChatPrice + user.homePrice + user.hospitalPrice + user.videoChatPrice) / 4) ₽",
                        education:
                            user.educationTypeLabel?.name ??
                        (user.higherEducation.count > 0 ? user.higherEducation[0].university : "")
                    )
                    doctors.append(doctor)
                })
                self.doctors = doctors
            })
        
    }
}
