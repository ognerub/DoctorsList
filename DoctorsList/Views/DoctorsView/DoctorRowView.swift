//
//  DoctorRow.swift
//  DoctorsList
//
//  Created by Ognerub on 3/8/24.
//

import SwiftUI
import URLImage

struct DoctorRowView: View {
    
    let doctor: Doctor
    let buttonTitle: String
    let buttonColor: Color
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    ProfileImageView(url: doctor.img)
                        .frame(minWidth: 50, maxWidth: 50)
                    VStack (alignment: .leading, spacing: 8) {
                        Text(doctor.lastName + "\n" + doctor.name + " " + doctor.patronymic)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .padding(.horizontal, 0)
                        HStack(spacing: 2.5) {
                            RatingStarsView(doctor: doctor)
                            Text(" • стаж \(doctor.workExpirience)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Text(doctor.specialization)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(doctor.price)
                    }
                    Spacer()
                    Image("likeOff")
                        .frame(width: 20)
                }
                
                StandartButtonView(title: buttonTitle, backgroundColor: buttonColor)
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }.background(Color.white)
            .cornerRadius(8)
        
    }
}

struct DoctorRow_Previews: PreviewProvider {
    static var previews: some View {
        DoctorRowView(
            doctor: Doctor(
                id: UUID(),
                name: "Name",
                patronymic: "Patromymic",
                lastName: "Last", img: "",
                rating: 0,
                specialization: "Specialization",
                workExpirience: "стаж 14",
                price: "от 600 ₽",
                education: "University"),
            buttonTitle: "Записаться",
            buttonColor: Color("pinkColor")
        )
    }
}
