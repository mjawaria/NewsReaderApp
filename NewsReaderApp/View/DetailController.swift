//
//  DetailController.swift
//  NewsReaderApp
//
//  Created by Mukul on 22/09/24.
//

import Foundation
import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        titleLabel.text = viewModel.title
        newsDetailLabel.text = viewModel.detail
    }
    
    func configure(with article: Article) {
        viewModel = DetailViewModel(article: article)
        self.setURl(imageUrlString: article.urlToImage ?? "")
    }
    
    func setURl(imageUrlString: String) {
        if let url = URL(string: imageUrlString) {
            downloadImage(from: url)
        }
    }
    
    func downloadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to download image: \(error?.localizedDescription ?? "No error description")")
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
