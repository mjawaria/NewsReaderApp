//
//  News.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import Foundation

struct Article: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}
