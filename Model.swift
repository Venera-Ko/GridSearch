//
//  Model.swift
//  GridSearch
//
//  Created by V K on 03.10.2022.
//

import Foundation
import Combine

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable {
    let name, artworkUrl100, releaseDate, artistName: String
}

class GridViewModel: ObservableObject {
    @Published var results = [Result]()
    
    init() {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data)
                print(rss)
                self.results = rss.feed.results
            } catch {
                print("Failed to decode \(error)")
            }
        }
        .resume()
    }
}

