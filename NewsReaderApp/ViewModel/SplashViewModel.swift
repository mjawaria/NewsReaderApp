//
//  SplashViewModel.swift
//  NewsReaderApp
//
//  Created by Mukul on 21/09/24.
//

import Foundation
import UIKit

class SplashViewModel {
    
    var onAnimationCompleted: (() -> Void)?
    
    func performAnimation(label: UILabel) {
        let originalY = label.center.y
        UIView.animate(withDuration: 3.0, animations: {
            label.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            label.center.y = originalY + 200
        }) { [weak self] _ in
            self?.onAnimationCompleted?()
        }
    }
}
