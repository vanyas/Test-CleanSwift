//
//  ItunesSearcheableAPI.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public protocol ItunesSearchableAPI {

  func searchContent(by term: String,
                     completion: @escaping APICompletion<[SearchResult]>) throws -> Void

  func searchContent(by term: String,
                     searchMedia: SearchMedia,
                     completion: @escaping APICompletion<[SearchResult]>) throws -> Void
}
