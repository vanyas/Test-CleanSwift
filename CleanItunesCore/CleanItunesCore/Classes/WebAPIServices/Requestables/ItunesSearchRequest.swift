//
//  ItunesSearchRequest.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

struct ItunesSearchRequest: Requestable {

  // MARK: - Requestable Properties
  var baseURL: URL

  var path: String?

  var parameters: [String: Any]?

  var method: APIRequestMethod

  var headers: [String: String]?
}
