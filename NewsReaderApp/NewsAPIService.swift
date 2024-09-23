//
//  NewsAPIService.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import Foundation
import Combine


struct NewsResponse: Codable {
    let articles: [Article]
}

class NewsAPIService {
    private let apiKey = "8345f57f64714a9ca3637d35c739c9ef"
    private let baseURL = "https://newsapi.org/v2/top-headlines"
    
    func fetchNews(category: String) -> AnyPublisher<[Article], Error> {
        let urlString = "\(baseURL)?category=\(category)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
