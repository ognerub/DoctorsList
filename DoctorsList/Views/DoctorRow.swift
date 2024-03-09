//
//  DoctorRow.swift
//  DoctorsList
//
//  Created by Ognerub on 3/8/24.
//

import SwiftUI
import URLImage

struct DoctorRow: View {
    
    let doctor: Doctor
    let buttonTitle: String
    let buttonColor: Color
    let url: String
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    URLImageView(url: url)
//                        .resizable()
//                        .scaledToFit()
                        .frame(minWidth: 50, maxWidth: 50)
//                        .cornerRadius(25)
                    VStack (alignment: .leading, spacing: 8) {
                        Text(doctor.lastName + "\n" + doctor.name + " " + doctor.patronymic)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .padding(.horizontal, 0)
                        HStack(spacing: 2.5) {
                            Image("starOn")
                            Image("starOff")
                            Image("starOn")
                            Image("starOff")
                            Image("starOn")
                        }
                        Text("Pediator")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image("likeOff")
                        .frame(width: 20)
                }
                StandartButton(title: buttonTitle, backgroundColor: buttonColor)
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }.background(Color.white)
            .cornerRadius(8)
        
    }
}

struct DoctorRow_Previews: PreviewProvider {
    static var previews: some View {
        DoctorRow(doctor: Doctor(id: UUID(), name: "Name", patronymic: "Patromymic", lastName: "Last", img: ""), buttonTitle: "Записаться", buttonColor: Color("pinkColor"), url: "")
    }
}

struct StandartButton: View {
    
    var title: String
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.title2)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 47)
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
