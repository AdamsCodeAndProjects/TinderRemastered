//
//  RoundedImage.swift
//  TinderApp
//
//  Created by adam janusewski on 3/10/22.
//

//  Added package Kingfisher to have a rounded image URL

import SwiftUI
import Kingfisher

struct RoundedImage: View {
    var url: URL?
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
