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
                HStack {
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DoctorView(id: doctor.id)) {
                            Text(doctor.name)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Navigation", displayMode: .inline)
    }
}

struct DoctorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsView()
    }
}
