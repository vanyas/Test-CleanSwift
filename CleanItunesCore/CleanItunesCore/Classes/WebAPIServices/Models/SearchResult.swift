//
//  SearchResult.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import ObjectMapper

public struct SearchResult {
  public let wrapperType: String
  public let kind: String
  public let trackName: String
  public let artistName: String
  public let artworkUrl100: URL?
}

// MARK: - Mappable Implementation
extension SearchResult: ImmutableMappable {

  public init(map: Map) throws {
    let urlTransform = TransformOf<URL, String>(
      fromJSON: { URL(string: $0!)},
      toJSON: {$0?.absoluteString}
    )

    wrapperType     = try map.value("wrapperType")
    kind            = try map.value("kind")
    trackName       = try map.value("trackName")
    artistName      = try map.value("artistName")
    artworkUrl100   = try map.value("artworkUrl100", using: urlTransform)
  }
}
