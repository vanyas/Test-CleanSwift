//
//  ItunesSearchRequestAdapter.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

enum ItunesSearchAPIPath: String {
  case search
}

class ItunesSearchRequestAdapter {
  // MARK: - Properties
  let baseURL: URL

  init(baseURL: URL) {
    self.baseURL = baseURL
  }

  // MARK: - Adapting Requests
  func newSearchContent(by term: String, searchMedia: SearchMedia?) throws  ->ItunesSearchRequest {
    guard !term.isEmpty,
          let encodedterm = term.addingPercentEncoding(
            withAllowedCharacters: CharacterSet.urlQueryAllowed
          ) else {
      throw APIRequestError.missingParameters
    }

    var parameters = [String: Any]()
    parameters["term"] = encodedterm

    if let mediaType = searchMedia?.media {
      parameters["media"] = mediaType.rawValue
    }

    if let entityType = searchMedia?.entity {
      parameters["entity"] = entityType.rawValue
    }

    return ItunesSearchRequest(
      baseURL: baseURL,
      path: ItunesSearchAPIPath.search.rawValue,
      parameters: parameters,
      method: APIRequestMethod.get,
      headers: nil
    )
  }
}
