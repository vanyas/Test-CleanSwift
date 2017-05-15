//
//  ItunesSearchResponse.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

class ItunesSearchResponseHandler: Responseable {

  // MARK: - RCOResponseable Properties
  typealias ResponseType = SearchResult
  var completionClosure: APICompletion<SearchResult>

  // MARK: - Initializers
  init(withCompletion completionClosure: @escaping APICompletion<SearchResult>) {
    self.completionClosure = completionClosure
  }

  // MARK: - Process Success
  func processSucceededRequest(withResponse response:Any?) -> Void {
    // TODO: ADD DESERIALIZATION
    let result = SearchResult(wrapperType: "", kind: "", trackName: "", artistName: "", collectionName: "", artworkUrl100: nil)

    let response = APIResponseResult.success(result)
    completionClosure(response)
  }

  // MARK: - Process Failure
  func processFailedRequest(withError failureError: Error?) -> Void {
    //TODO: Process Error
    completionClosure(APIResponseResult.failure(APIResponseError.native(failureError)))
  }
}
