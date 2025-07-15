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
            ScrollView() {
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
                        meme = await loadRandomMeme()
                    }
                }
                .disabled(askPepe.isEmpty)
                .buttonStyle(.bordered)
                .tint(.cyan)
            }
            .scrollDisabled(true)
            
            if let meme = meme {
                MemeView(meme: meme)
                    .scaledToFit()
            } else {
                Image(.image)
                    .resizable()
                    .frame(width: 256,height: 256)
            }
            
            Spacer()
            
            HStack {
                Button("👍") {
                    askPepe = ""
                    meme = nil
                }
                .tint(.green)
                
                Button("👎") {
                    Task {
                        meme = await loadRandomMeme()
                    }
                }
                .tint(.red)
                
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .disabled(meme == nil)
        }
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    ContentView()
}

func getMemesFromAPI() async -> [Meme] {
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

func loadRandomMeme() async -> Meme? {
    await getMemesFromAPI().randomElement()
}
