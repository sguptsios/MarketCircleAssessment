//
//  ContentViewModelText.swift
//  MarketCircleAssessmentTests
//
//  Created by Sagar Gupta on 05/03/24.
//

@testable import MarketCircleAssessment
import XCTest

final class ContentViewModelText: XCTestCase {

    override class func setUp() {
        
    }
    
    override class func tearDown() {
        
    }
    
    func testGetData() {
        let viewModel = ContentViewModel(dataManager: DataManager())
        XCTAssertFalse(viewModel.presentingAlert)
        XCTAssertEqual(viewModel.error, .none)
        XCTAssertNil(viewModel.data)
        XCTAssertNil(viewModel.selectedItem)
        viewModel.getData()
        sleep(1)
        XCTAssertEqual(viewModel.data?.count, 10)
    }

}
