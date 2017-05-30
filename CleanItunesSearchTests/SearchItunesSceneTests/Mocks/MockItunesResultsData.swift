//
//  MockItunesResultsData.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/30/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesSearch
@testable import CleanItunesCore


func MockData_LoadSearchResults() -> [SearchResult] {
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
