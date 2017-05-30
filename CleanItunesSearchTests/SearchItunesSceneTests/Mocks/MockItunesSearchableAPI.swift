//
//  MockItunesSearchableAPI.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/30/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
@testable import CleanItunesCore

class MockItunesSearchableAPI: ItunesSearchableAPI {

  //  MARK: Properties
  var responseResults: [SearchResult]?

  func searchContent(by term: String, completion: @escaping (APIResponseResult<[SearchResult]>) -> Void) throws {
    guard let responseResults = responseResults else {
      let error = APIResponseError.badResponse(nil)
      completion(APIResponseResult.failure(error))
      return
    }

    completion(APIResponseResult.success(responseResults))
  }

  func searchContent(by term: String, searchMedia: SearchMedia, completion: @escaping (APIResponseResult<[SearchResult]>) -> Void) throws {
    try searchContent(by: term, completion: completion)
  }
}
