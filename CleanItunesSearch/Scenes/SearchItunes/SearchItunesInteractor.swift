//
//  SearchItunesInteractor.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

class SearchItunesInteractor {

  // MARK: - Public Properties
  var output: SearchItunesViewInteractorPresenterBoundary!

  // MARK: - Workers
  var searchResultsWorker: SearchItunesResultsWorker = SearchItunesResultsAPIWorker()

}

// MARK: - SearchItunesViewInteractorBoundary Implementation
extension SearchItunesInteractor: SearchItunesViewInteractorBoundary {

  func searchItunes(request: SearchItunesScene.SearchByTerm.Request) {
    let term = request.term
    searchResultsWorker.fetchResults(by: term) { [unowned self](results) in
      self.output.presentFetchedResults(searchResults: results)
    }
  }
}
