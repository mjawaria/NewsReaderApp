//
//  NewsListViewModel.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import Foundation
import UIKit
import Combine

class NewsListViewModel {
    
    private var articles: [Article] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private let newsService = NewsAPIService()
    
    var numberOfNews: Int {
        return articles.count
    }
    
    func loadNews() {
        // Load the products here (from a data source, API, etc.)
        self.fetchArticles(category: "business")
    }
    
    func fetchArticles(category: String) {
          newsService.fetchNews(category: category)
              .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] articles in
                  self?.articles = articles
              })
              .store(in: &cancellables)
      }
    
    func news(at index: Int) -> Article {
        return articles[index]
    }
    
    func cellSize(for collectionView: UICollectionView) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 15, height: 200.0)
    }
}
