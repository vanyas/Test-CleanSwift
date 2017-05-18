//
//  SearchItunesPresenter.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import CleanItunesCore

class SearchItunesPresenter {

  // MARK: - Public Properties
  weak var output: SearchItunesPresenterViewBoundary!

}

// MARK: - SearchItunesViewInteractorPresenterBoundary Implementation
extension SearchItunesPresenter: SearchItunesViewInteractorPresenterBoundary {

  func presentFetchedResults(searchResults: [SearchResult]) {
    //Format Results
    let displayedResults = searchResults.map { (rawResult) -> SearchItunesScene.SearchByTerm.ViewModel.DisplayedResult in
      let displayed = SearchItunesScene.SearchByTerm.ViewModel.DisplayedResult(
        category: setCategory(by: rawResult.kind),
        title: rawResult.trackName,
        author: rawResult.artistName,
        imageURL: rawResult.artworkUrl100
      )
      return displayed
    }

    let viewModel = SearchItunesScene.SearchByTerm.ViewModel(
      displayedResults: displayedResults
    )

    output.displayFetchedResults(viewModel: viewModel)
  }


  fileprivate func setCategory(by kind: String) -> String {
    switch kind {
      case "feature-movie":
        return "Movies"
      case "song":
        return "Music"
      case "tv-episode":
        return "TV&Series"
      case "podcast":
        return "Podcasts"
      default:
        return "Other"
    }
  }
}
