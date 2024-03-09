//
//  DoctorView.swift
//  DoctorsList
//
//  Created by Ognerub on 3/7/24.
//

import SwiftUI

struct DoctorView: View {
    var id: UUID?
    
    @ObservedObject var viewModel = DoctorViewModel()
    
    var body: some View {
        HStack {
            Text(viewModel.doctor?.name ?? "Noname")
            Image("photo")
        }.onAppear {
            self.viewModel.getDoctor(id: id)
        }
    }
}
