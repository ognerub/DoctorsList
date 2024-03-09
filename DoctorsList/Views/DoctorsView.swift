//
//  DoctorsView.swift
//  DoctorsList
//
//  Created by Ognerubon 3/6/24.
//

import SwiftUI

struct DoctorsView: View {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    @ObservedObject var viewModel = DoctorsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.doctors) { doctor in
                DoctorRow(
                    doctor: doctor,
                    buttonTitle: "Записаться",
                    buttonColor: Color("pinkColor"),
                    url: doctor.img ?? ""
                )
                .background(
                    NavigationLink("", destination: DoctorView(id: doctor.id))
                        .opacity(0)
                )
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
            }
            .background(Color("lightGreyColor"))
            .scrollContentBackground(.hidden)
        }
    }
}

struct DoctorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsView()
    }
}
