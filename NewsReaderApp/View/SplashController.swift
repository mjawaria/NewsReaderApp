//
//  SplashController.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import UIKit

class SplashController: UIViewController {
    
    @IBOutlet weak var labelAppTitle: UILabel!
    private var viewModel: SplashViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SplashViewModel()
        bindViewModel()
        setup()
    }
    
    private func setup() {
        viewModel.performAnimation(label: labelAppTitle)
    }
    
    private func bindViewModel() {
        viewModel.onAnimationCompleted = {[weak self] in
            self?.goToHome()
        }
    }
    
    private func goToHome() {
        let navController = self.storyboard?.instantiateViewController(withIdentifier: AppStrings.newsListController) as! UINavigationController
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
}
