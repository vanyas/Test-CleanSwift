//
//  SearchItunesInteractorTests.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/26/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesSearch
@testable import CleanItunesCore

class SearchItunesInteractorTests: XCTestCase {

  //  MARK: Properties
  var interactor: SearchItunesInteractor!
  var presenter: MockSearchItunesViewInteractorPresenterBoundary!

  override func setUp() {
    super.setUp()
    presenter = MockSearchItunesViewInteractorPresenterBoundary()
    interactor = SearchItunesInteractor()
    interactor.output = presenter
  }

  //  MARK: Tests
  func testSearchItunes_shouldInvokePresentFetchedResults() {
    //Setup
    let request = SearchItunesScene.SearchByTerm.Request(term: "test")
    let fakeWorker = FakeSearchItunesResultsAPIWorker()
    interactor.searchResultsWorker = fakeWorker

    //Test
    interactor.searchItunes(request: request)

    // Verify
    XCTAssertTrue(presenter.wasPresentFetchedResultsCalled, "presentFetchedResults was not called.")
  }
}


//  MARK: Fakers
fileprivate class FakeSearchItunesResultsAPIWorker: SearchItunesResultsWorker {

  //  MARK: Properties
  var results = [SearchResult]()

  //  MARK: SearchItunesResultsWorker Implementation
  func fetchResults(by term: String, completionHandler: @escaping ResultsFetchedClosure) {
    completionHandler(self.results)
  }
}
