//
//  SearchItunesProtocols.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import CleanItunesCore

// MARK: - View-Interactor Boundary
protocol SearchItunesViewInteractorBoundary {

  func searchItunes(request: SearchItunesScene.SearchByTerm.Request)
}

// MARK: - Interactor-Presenter Boundary
protocol SearchItunesViewInteractorPresenterBoundary {

  func presentFetchedResults(searchResults: [SearchResult])

}

// MARK: - Presenter-View Boundary
protocol SearchItunesPresenterViewBoundary: class {

  func displayFetchedResults(viewModel: SearchItunesScene.SearchByTerm.ViewModel)
}

// MARK: - Workers
typealias ResultsFetchedClosure = (_ results: [SearchResult]) -> Void

protocol SearchItunesResultsWorker {

  func fetchResults(by term: String,
                    completionHandler: @escaping ResultsFetchedClosure)
}
