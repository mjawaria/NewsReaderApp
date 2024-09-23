//
//  SplashViewModelTests.swift
//  NewsReaderAppTests
//
//  Created by Mukul on 23/09/24.
//

import XCTest
@testable import NewsReaderApp

final class SplashViewModelTests: XCTestCase {
    
    var viewModel: SplashViewModel!
    var label: UILabel!
    
    override func setUp() {
        super.setUp()
        viewModel = SplashViewModel()
        label = UILabel()
    }
    
    override func tearDown() {
        viewModel = nil
        label = nil
        super.tearDown()
    }
    
    func testPerformAnimation() {
        // Given
        let originalY: CGFloat = 100.0
        label.center = CGPoint(x: 0, y: originalY)
        
        // Define an expectation for the animation to complete
        let animationExpectation = expectation(description: "Animation completed")
        
        viewModel.onAnimationCompleted = {
            animationExpectation.fulfill()
        }
        
        // When
        viewModel.performAnimation(label: label)
        
        // Then
        waitForExpectations(timeout: 3.5, handler: nil)
        
        // Verify label transformations
        XCTAssertEqual(label.transform, CGAffineTransform(scaleX: 1.3, y: 1.3), "Label should be scaled to 1.3x")
        XCTAssertEqual(label.center.y, originalY + 200, "Label's center.y should be moved by 200 points")
    }
    
    func testAnimationCompletionCallback() {
        let animationExpectation = expectation(description: "Animation completion callback")
        
        viewModel.onAnimationCompleted = {
            animationExpectation.fulfill()
        }
        
        viewModel.performAnimation(label: label)
        
        waitForExpectations(timeout: 3.5, handler: nil)
    }
}
