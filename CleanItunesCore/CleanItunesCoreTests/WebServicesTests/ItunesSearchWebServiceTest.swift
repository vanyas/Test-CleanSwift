//
//  ItunesSearchWebServiceTest.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesCore

class ItunesSearchWebServiceTest: XCTestCase {

  // MARK: - Constans
  let maxWaitingTime: TimeInterval = 5

  // MARK: - Properties
  var webService: ItunesSearchWebService!
  var mockWebAPIClient: MockWebAPIClient!
    
  override func setUp() {
    super.setUp()
    let mockURL = URL(string: "http://www.test.com")!
    mockWebAPIClient =  MockWebAPIClient()
    webService = ItunesSearchWebService(
      using: mockWebAPIClient,
      requestAdapter: ItunesSearchRequestAdapter(baseURL: mockURL)
    )
  }

  // MARK: - Tests
  func testSearchContentBytTerm_withoutError_shouldStartProcessSuccessfulResult() {
    // Setup
    let expectAsync = expectation(description: "Search Content By term")
    let mockClient = mockWebAPIClient!

    // Test
    do {
      try webService.searchContent(by: "test term") { (response) in
        expectAsync.fulfill()

        //Verify
        XCTAssert(mockClient.processSuccesWasCalled, "Success should have been invoked")
      }
    } catch {
      XCTFail("Error while invoking 'searchContent' \(error)")
    }
    waitForExpectations(timeout: maxWaitingTime, handler: nil)
  }

  func testSearchContentBytTerm_withError_shouldStartProcessFailureResult() {
    // Setup
    let expectAsync = expectation(description: "Search Content By term")
    let mockClient = mockWebAPIClient!
    mockWebAPIClient.errorValue = APIResponseError.businessLogic

    // Test
    do {
      try webService.searchContent(by: "test term") { (response) in
        expectAsync.fulfill()

        //Verify
        XCTAssert(mockClient.processFailureWasCalled, "Failure should have been invoked")
      }
    } catch {
      XCTFail("Error while invoking 'searchContent' \(error)")
    }
    waitForExpectations(timeout: maxWaitingTime, handler: nil)
  }

}
