//
//  ContentView.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State var askPepe = ""
    
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
