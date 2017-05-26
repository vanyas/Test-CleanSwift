//
//  SearchItunesUseCases.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/26/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

protocol SearchItunesResultCategoryMappable {

  var supportedResultKinds: [String] { get }

  func mapCategory(from resultKind: String) -> String
}
