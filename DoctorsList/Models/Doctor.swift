//
//  Doctor.swift
//  DoctorsList
//
//  Created by Ognerub on 3/8/24.
//

import Foundation

struct Doctor: Identifiable {
    let id: UUID
    let name: String
    let patronymic: String
    let lastName: String
    let img: String?
}
