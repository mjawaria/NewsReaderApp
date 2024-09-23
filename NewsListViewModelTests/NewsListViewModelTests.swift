//
//  NewsListViewModelTests.swift
//  NewsReaderAppTests
//
//  Created by Mukul on 23/09/24.
//

import XCTest
@testable import NewsReaderApp

final class NewsListViewModelTests: XCTestCase {
    
    var viewModel: NewsListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = NewsListViewModel()
    }
    
    override func tearDown() {
        // Clean up after each test
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadNews() {
        viewModel.loadNews()
        
        XCTAssertEqual(viewModel.numberOfNews, 12, "The number of products should be 3 after loading")
    }
    
    func testNewsAtValidIndex() {
        viewModel.loadNews()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
