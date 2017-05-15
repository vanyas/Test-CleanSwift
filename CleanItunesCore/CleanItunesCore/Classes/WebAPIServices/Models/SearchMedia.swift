//
//  SearchMedia.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public struct SearchMedia {

  public enum EntityType: String {
    case movieArtist
    case movie
    case musicArtist
    case musicTrack
    case musicVideo
    case album
    case song
    case tvEpisode
    case tvSeason
    case software
    case iPadSoftware
    case macSoftware
    case allArtist
    case allTrack
  }

  public enum MediaType: String {
    case movie
    case music
    case tvShow
    case software
    case all
  }

  // MARK: - Properties
  let media: MediaType
  let entity: EntityType?

  // MARK: - Initializer
  public init(media: MediaType, entity: EntityType? = nil) {
    self.media = media
    self.entity = entity
  }
}
