//
//  ContentView.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State var askPepe = ""
    var memes = getMemes()
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .foregroundStyle(.foreground)
                TextField("спроси пепачку", text: $askPepe)
                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Button("ПОЛУЧИТЬ ПРЕДСКАЗАНИЕ") {
                
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.foreground)
            
            Image(.image)
                .resizable()
                .frame(width: 256,height: 256)
            
            HStack {
                Button("👍") {
                    
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Button("👎") {
                    
                }
                .buttonStyle(.bordered)
                .tint(.red)
                
            }
        }
    }
}

#Preview {
    ContentView()
}

func getMemes() -> [Meme] {
    return [
        .init(
            id: 61579,
            name: "One Does Not Simply",
            url: .init(string: "https://i.imgflip.com/1bij.jpg")!,
            width: 568,
            height: 335,
            boxCount: 2
        ),
        .init(
            id: 101470,
            name: "Ancient Aliens",
            url: .init(string: "https://i.imgflip.com/26am.jpg")!,
            width: 500,
            height: 437,
            boxCount: 2
        )
    ]
}
