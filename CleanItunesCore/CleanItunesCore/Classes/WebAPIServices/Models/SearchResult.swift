//
//  SearchResult.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public struct SearchResult {
  public let wrapperType: String
  public let kind: String
  public let trackName: String
  public let artistName: String
  public let collectionName: String
  public let artworkUrl100: URL?
}
