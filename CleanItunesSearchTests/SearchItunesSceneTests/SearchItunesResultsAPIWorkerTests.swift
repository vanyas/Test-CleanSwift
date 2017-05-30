//
//  SearchItunesResultsAPIWorkerTests.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/30/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesCore
@testable import CleanItunesSearch

class SearchItunesResultsAPIWorkerTests: XCTestCase {

  //  MARK: Properties
  var webServiceMock: MockItunesSearchableAPI!
  var apiWorker: SearchItunesResultsAPIWorker!

  override func setUp() {
    super.setUp()
    webServiceMock = MockItunesSearchableAPI()
    apiWorker = SearchItunesResultsAPIWorker(webService: webServiceMock)
  }

  //  MARK: Tests
  func testFetchResults_withSuccessfulResponse_shouldReturnSearchResultsArray() {
    // Setup
    let expectedResults = MockData_LoadSearchResults()
    webServiceMock.responseResults = expectedResults

    //Test
    apiWorker.fetchResults(by: "test term") { (searchResults) in
      //Verify
      XCTAssertEqual(expectedResults.count, searchResults.count, "SearchResulst count does not match.")
    }
  }

  func testFetchResults_withUnsucessfulResponse_shouldReturnEmptySearchResultsArray() {
    // Setup
    webServiceMock.responseResults = nil

    //Test
    apiWorker.fetchResults(by: "test term") { (searchResults) in
      //Verify
      XCTAssertEqual(0, searchResults.count, "SearchResulst should be empty.")
    }
  }
}
