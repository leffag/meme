//
//  Meme.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

import Foundation

struct Meme: Codable {
    let id: Int
    let name: String
    let url: URL
    let width: Int
    let height: Int
    let boxCount: Int
}
