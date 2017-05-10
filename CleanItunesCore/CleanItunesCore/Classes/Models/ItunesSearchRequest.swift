//
//  ItunesSearchRequest.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/10/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public struct ItunesSearchRequest {
  let term: String

  // MARK: - Initializer
  public init(term: String) {
    self.term = term
  }
}
