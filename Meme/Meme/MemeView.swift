//
//  MemeView.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

import SwiftUI

struct MemeView: View {
    var meme: Meme
    
    var body: some View {
        AsyncImage(
            url: meme.url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            },
            placeholder: {
                ProgressView()
                // TODO: кастомная анимация загрузки
            }
        )
    }
}

#Preview {
    MemeView(
        meme: .init(
            id: "101470",
            name: "Ancient Aliens",
            url: .init(string: "https://i.imgflip.com/26am.jpg")!,
        )
    )
}
