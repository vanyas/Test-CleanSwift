//
//  SearchItunesResultsAPIWorker.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import CleanItunesCore

class SearchItunesResultsAPIWorker: SearchItunesResultsWorker {

  // MARK: - Properties
  let webService: ItunesSearchableAPI!

  // MARK: - Initializer
  init() {
    let baseURL = URL(string: "https://itunes.apple.com/search")!
    webService = WebAPIServicesFactory.createItunesSearchWebService(for: baseURL)
  }

  // MARK: - SearchItunesResultsWorker Implementation

  func fetchResults(by term: String,
                    completionHandler: @escaping ResultsFetchedClosure) {
    do {
      try webService.searchContent(by: term) { (result) in
        switch result {
          case .failure(_):
            return completionHandler([SearchResult]())
          case .success(let searchResults):
            return completionHandler(searchResults)
        }
      }
    } catch{
      completionHandler([SearchResult]())
    }
  }

}
