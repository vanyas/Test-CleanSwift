//
//  MockSearchItunesViewInteractorPresenterBoundary.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/26/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
@testable import CleanItunesSearch
@testable import CleanItunesCore

class MockSearchItunesViewInteractorPresenterBoundary: SearchItunesInteractorPresenterBoundary {

  //  MARK: Properties
  var wasPresentFetchedResultsCalled = false
  var searchResults: [SearchResult]?


  //  MARK: SearchItunesViewInteractorPresenterBoundary Implementation
  func presentFetchedResults(searchResults: [SearchResult]) {
    wasPresentFetchedResultsCalled = true
    self.searchResults = searchResults
  }
}
