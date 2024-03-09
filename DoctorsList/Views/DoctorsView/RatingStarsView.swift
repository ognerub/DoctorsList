//
//  RatingStarsView.swift
//  DoctorsList
//
//  Created by Ognerub on 3/9/24.
//

import SwiftUI

struct RatingStarsView: View {
    
    let doctor: Doctor
    
    var body: some View {
        HStack(spacing: 2.5) {
            let rating = doctor.rating
            switch rating {
            case 1..<2:
                createStars(rating: 1)
            case 2..<3:
                createStars(rating: 2)
            case 3..<4:
                createStars(rating: 3)
            case 4..<5:
                createStars(rating: 4)
            case 5...:
                createStars(rating: 5)
            default:
                createStars(rating: 0)
            }
        }
    }
    
    private func createStars(rating: Int) -> some View {
        HStack(spacing: 2.5) {
            let off: Int = (5 - rating) - 1
            let on: Int = (5 - (5 - rating)) - 1
            if on > -1 {
                ForEach((0...on), id: \.self) { _ in
                    Image("starOn")
                }
            }
            if off > -1 {
                ForEach((0...off), id: \.self) { _ in
                    Image("starOff")
                }
            }
        }
    }
}

struct RatingStarsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsView(
            doctor: Doctor(
                id: UUID(),
                name: "Name",
                patronymic: "Patromymic",
                lastName: "Last",
                img: "",
                rating: 0,
                specialization: "Specialization",
                workExpirience: "No date",
                price: "от 600 ₽",
                education: "University")
        )
    }
}
