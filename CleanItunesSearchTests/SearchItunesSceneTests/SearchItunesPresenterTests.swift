//
//  SearchItunesPresenterTests.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/25/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesSearch
@testable import CleanItunesCore

class SearchItunesPresenterTests: XCTestCase {

  //  MARK: Properties
  var presenter: SearchItunesPresenter!
  var viewMock: MockSearchItunesPresenterViewBoundary!

  //  MARK: Setup
  override func setUp() {
    super.setUp()
    presenter = SearchItunesPresenter()
    viewMock = MockSearchItunesPresenterViewBoundary()
    presenter.output = viewMock
  }

  func testPresentFetchedResults_withValidResults_shouldCallDisplayFetchedResults() {
    // Setup
    let searchResults = loadSearchResults()
    // Test
    presenter.presentFetchedResults(searchResults: searchResults)

    // Verify
    XCTAssertTrue(viewMock.wasDisplayFetchedResultsCalled, "DisplayFetchedResults was not invoked")
  }

  func testPresentFetchedResults_shouldMatchViewModel() {
    // Setup
    let searchResult = loadSearchResults()[0]
    let displayedResult = SearchItunesScene.SearchByTerm.ViewModel.DisplayedResult(
      category: "Other",
      title: searchResult.trackName,
      author: searchResult.artistName,
      imageURL: nil
    )

    let displayedResults = [displayedResult]

    // Test
    presenter.presentFetchedResults(searchResults: [searchResult])

    // Verify
    XCTAssertNotNil(viewMock.viewModel)
    XCTAssertEqual(1, viewMock.viewModel!.displayedResults.count)
    XCTAssertEqual(displayedResults, viewMock.viewModel!.displayedResults)
  }
}


//  MARK: Mock Data
extension SearchItunesPresenterTests {

  fileprivate func loadSearchResults() -> [SearchResult] {
    var searchResults = [SearchResult]()

    for _ in 1...10 {
      searchResults.append(
        SearchResult(
          wrapperType: "testType",
          kind: "testKind",
          trackName: "testTrack",
          artistName: "testArtist",
          artworkUrl100: nil
        )
      )
    }

    return searchResults
  }

}
