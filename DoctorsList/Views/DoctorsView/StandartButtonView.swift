//
//  StandartButtonView.swift
//  DoctorsList
//
//  Created by Ognerub on 3/9/24.
//

import SwiftUI

struct StandartButtonView: View {
    
    var title: String
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 47)
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct StandartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StandartButtonView(title: "Button", backgroundColor: Color("pinkColor"))
    }
}
