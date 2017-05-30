//
//  SearchItunesResultCategoryMapper.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/26/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

class SearchItunesResultCategoryMapper: SearchItunesResultCategoryMappable {

  fileprivate enum categoryType: String {
    case Movies
    case Music
    case TVandSeries = "TV&Series"
    case Podcasts
    case Other

    init(resultKind: String) {
      switch resultKind {
        case "feature-movie":
          self = .Movies
        case "song":
          self = .Music
        case "tv-episode":
          self = .TVandSeries
        case "podcast":
          self = .Podcasts
        default:
          self = .Other
      }
    }
  }

  fileprivate(set) lazy var supportedResultKinds: [String] = {
    return [
      "feature-movie",
      "song",
      "tv-episode",
      "podcast"
    ]
  }()

  func mapCategory(from resultKind: String) -> String {
    return categoryType.init(resultKind: resultKind).rawValue
  }
}
