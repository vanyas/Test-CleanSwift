//
//  SearchItunesModels.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import CleanItunesCore

// MARK: - Search Itunes Use Cases
struct SearchItunesScene {

  // MARK: - Searh by Term
  struct SearchByTerm {

    struct Request {
      let term: String
    }

    struct Response {
      var results: [SearchResult]
    }

    struct ViewModel {

      struct DisplayedResult {
        let category: String
        let title: String
        let author: String
        let imageURL: URL?
      }

      var displayedResults: [DisplayedResult]
    }
  }
}
