//
//  NewsCell.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import UIKit

class NewsCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonBuyNow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.borderColor = UIColor.darkGray.cgColor
        self.contentView.layer.borderWidth = 1.0
        self.buttonBuyNow.layer.cornerRadius = 5.0
    }
    
    @IBAction func buyButtonAction(_ sender: Any) {

    }
    
    func setURl(imageUrlString: String) {
        if let url = URL(string: imageUrlString) {
            downloadImage(from: url)
        }
    }
    // Download image function
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
