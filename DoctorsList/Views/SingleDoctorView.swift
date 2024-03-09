//
//  DoctorView.swift
//  DoctorsList
//
//  Created by Ognerub on 3/7/24.
//

import SwiftUI

struct SingleDoctorView: View {
    var doctor: Doctor
    
    @Environment(\.presentationMode) var presentationMode
    
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
                    }
                    Spacer()
                }
                VStack {
                    QualitiesView(icon: "experience", text: "Опыт работы: \(doctor.workExpirience)")
                    QualitiesView(icon: "education", text: "Врач высшей категории")
                    QualitiesView(icon: "institution", text: "\(doctor.education.count > 0 ? doctor.education : "Не указано")")
                    QualitiesView(icon: "location", text: "Не указано")
                    HStack {
                        Text("Стоимость услуг")
                        Spacer()
                        Text("\(doctor.price)")
                    }
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .border(Color("greyColor"))
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                }
                Spacer()
                StandartButtonView(title: "Записаться", backgroundColor: Color("pinkColor"))
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }.background(Color("lightGreyColor"))
            .navigationBarTitle(Text("\(doctor.specialization)"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
    }
}

struct CustomBackButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .padding(.horizontal, 10)
                .foregroundColor(.black)
        }
    }
}


struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        SingleDoctorView(doctor: Doctor(
            id: UUID(),
            name: "Name",
            patronymic: "Patromymic",
            lastName: "Last", img: "",
            rating: 0,
            specialization: "Specialization",
            workExpirience: "14",
            price: "от 600 ₽",
            education: "University")
        )
    }
}



struct QualitiesView: View {
    
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(icon)
                .frame(minWidth: 24, maxWidth: 24)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}
