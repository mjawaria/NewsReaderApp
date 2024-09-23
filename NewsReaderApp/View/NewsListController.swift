//
//  NewsListController.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import Foundation
import UIKit

class NewsListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    private var viewModel: NewsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsListViewModel()
        setupCollectionView()
        viewModel.loadNews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.productCollectionView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        let nib = UINib(nibName: AppStrings.newsCell, bundle: nil)
        productCollectionView.register(nib, forCellWithReuseIdentifier: AppStrings.newsCell)
        productCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    //MARK: Collection view datasource  & delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfNews
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppStrings.newsCell, for: indexPath) as? NewsCell else {
            fatalError(AppStrings.fatalErrorMessage)
        }
        
        let news = viewModel.news(at: indexPath.item)
        cell.titleLabel.text = news.title
        cell.setURl(imageUrlString:  news.urlToImage ?? "")
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.cellSize(for: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: AppStrings.detailController) as! DetailController
        detailVC.configure(with: viewModel.news(at: indexPath.item))
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
