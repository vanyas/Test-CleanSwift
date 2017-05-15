//
//  SearchResult.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public struct SearchResult {
  let wrapperType: String
  let kind: String
  let trackName: String
  let artistName: String
  let collectionName: String
  let artworkUrl100: URL?
}
