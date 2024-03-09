//
//  Image.swift
//  DoctorsList
//
//  Created by Ognerub on 3/8/24.
//

import SwiftUI
import URLImage

struct ProfileImageView: View {
    var url: String?
    
    var body: some View {
        guard let url = URL(string: url ?? "") else {
            return AnyView(Image("profileEmpty")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 50, maxWidth: 50)
                .cornerRadius(25))
        }
        return AnyView(URLImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(25)
        })
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(url: "")
    }
}


