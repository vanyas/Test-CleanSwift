//
//  MockSearchItunesPresenterViewBoundary.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/25/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
@testable import CleanItunesSearch

class MockSearchItunesPresenterViewBoundary: SearchItunesPresenterViewBoundary {

  //  MARK: Properties
  var wasDisplayFetchedResultsCalled = false
  var viewModel: SearchItunesScene.SearchByTerm.ViewModel?

  //  MARK: SearchItunesPresenterViewBoundary Implementation
  func displayFetchedResults(viewModel: SearchItunesScene.SearchByTerm.ViewModel) {
    wasDisplayFetchedResultsCalled = true
    self.viewModel = viewModel
  }
}
