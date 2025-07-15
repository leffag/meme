//
//  ContentView.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State var askPepe = ""
    @State var meme: Meme? = nil
    
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
                Task {
                    meme = await getMemes().randomElement()
                }
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.foreground)
            
            if let meme = meme {
                MemeView(meme: meme)
            } else {
                Image(.image)
                    .resizable()
                    .frame(width: 256,height: 256)
            }
            
            
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

func getMemes() async -> [Meme] {
    let data: Data
    
    let url = URL(string: "https://api.imgflip.com/get_memes")!
    
    do {
        data = try await URLSession.shared.data(from: url).0
    } catch {
        fatalError("Couldn't find")
    }
    
    do {
        let decodedResponce = try JSONDecoder().decode(MemesResponse.self, from: data)
        return decodedResponce.data.memes
    } catch {
        fatalError("ловити \(error)")
    }
}
