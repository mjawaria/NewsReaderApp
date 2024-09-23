//
//  DetailViewModel.swift
//  NewsReaderApp
//
//  Created by Mukul on 22/09/24.
//

import Foundation

import Foundation
import UIKit

class DetailViewModel {
    private var article: Article
 
    var title: String {
        return article.title
    }
    
    var detail: String {
        return article.description ?? ""
    }
    
    var image: UIImage?
    
    init(article: Article) {
        self.article = article
    }

}
