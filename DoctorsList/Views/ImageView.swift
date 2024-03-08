//
//  Image.swift
//  DoctorsList
//
//  Created by Ognerub on 3/8/24.
//

import SwiftUI
import URLImage

struct Image: View {
    var url: String?
    
    var body: some View {
        guard let url = URL(string: url ?? "") else {
            return AnyView(Text("No image"))
        }
        return AnyView(URLImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
    }
}


