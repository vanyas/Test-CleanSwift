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

  // MARK: - SearchContentByTerm Tests
  func testSearchContentByTerm_withoutError_shouldStartProcessSuccessfulResult() {
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

  func testSearchContentByTermAndSearchMedia_withoutError_shouldStartProcessSuccessfulResult() {
    // Setup
    let expectAsync = expectation(description: "Search Content By term")
    let mockClient = mockWebAPIClient!
    let searchMedia = SearchMedia.init(media: SearchMedia.MediaType.music,
                                       entity: SearchMedia.EntityType.allArtist)

    // Test
    do {
      try webService.searchContent(by: "test term", searchMedia: searchMedia) { (response) in
        expectAsync.fulfill()
        //Verify
        XCTAssert(mockClient.processSuccesWasCalled, "Success should have been invoked")
      }
    } catch {
      XCTFail("Error while invoking 'searchContent' \(error)")
    }
    waitForExpectations(timeout: maxWaitingTime, handler: nil)
  }

  func testSearchContentByTerm_withError_shouldStartProcessFailureResult() {
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

  func testSearchContentByTerm_withJSONReturned_shouldReturnSearchResults() {
    // Setup
    let expectAsync = expectation(description: "Search Content By term")

    let bundle = Bundle.init(for: type(of: self))
    let path = bundle.url(forResource: "search_results", withExtension: "json")!
    let data = try! Data(contentsOf: path)
    let mockResults = try! JSONSerialization.jsonObject(with: data, options: [])
    mockWebAPIClient.responseValue = mockResults
    
    // Test
    do {
      try webService.searchContent(by: "test term") { (response) in
        expectAsync.fulfill()

        //Verify
        switch response {
        case .failure(let error):
          XCTFail("Error Returned \(error)")
        case .success(let results):
          XCTAssertEqual(2, results.count, "Results Count Does not match")
          print(results)
        }
      }
    } catch {
      XCTFail("Error while invoking 'searchContent' \(error)")
    }
    waitForExpectations(timeout: maxWaitingTime, handler: nil)
  }
}
