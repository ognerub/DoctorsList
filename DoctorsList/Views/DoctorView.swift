//
//  DoctorView.swift
//  DoctorsList
//
//  Created by Ognerub on 3/7/24.
//

import SwiftUI

struct DoctorView: View {
    var id: Int?
    
    @ObservedObject var viewModel = DoctorViewModel()
    
    var body: some View {
        HStack {
            Text(viewModel.doctor?.name ?? "Noname")
        }.onAppear {
            self.viewModel.getDoctor(id: id ?? 0)
        }
    }
}
