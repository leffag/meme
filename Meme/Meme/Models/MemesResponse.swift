//
//  MemesResponse.swift
//  Meme
//
//  Created by Effin Leffin on 14.07.2025.
//

struct MemesResponse: Decodable {
    let data: MemesData
    
    struct MemesData: Decodable {
        let memes: [Meme]
    }
}
