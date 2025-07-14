//
//  Meme.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

import Foundation

struct Meme: Decodable, Equatable, Identifiable {
    let id: Int
    let name: String
    let url: URL
}
