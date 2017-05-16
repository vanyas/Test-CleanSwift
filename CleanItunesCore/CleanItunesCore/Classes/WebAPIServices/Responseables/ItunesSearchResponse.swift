//
//  ItunesSearchResponse.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import ObjectMapper

class ItunesSearchResponseHandler: Responseable {

  // MARK: - RCOResponseable Properties
  typealias ResponseType = [SearchResult]
  var completionClosure: APICompletion<ResponseType>

  // MARK: - Use Cases
  private let responseTransformer = ItunesSearchTransformResponseObject()

  // MARK: - Initializers
  init(withCompletion completionClosure: @escaping APICompletion<[SearchResult]>) {
    self.completionClosure = completionClosure
  }

  // MARK: - Process Success
  func processSucceededRequest(withResponse response:Any?) -> Void {
    do {
      /* Check Response in correct JSON Format */
      var results = try responseTransformer.transFormResponseObject(response)
      /* Filter Results */
      results = filterOnlytracks(from: results)
      /* Deserialize Results */
      let searchResults = try Mapper<SearchResult>().mapArray(JSONArray: results)
      completionClosure(APIResponseResult.success(searchResults))
    } catch let APIError as APIResponseError {
      print(APIError)
      completionClosure(APIResponseResult.failure(APIError))
    } catch /* Unexpected Error */ {
      print(error)
      let badResponse = APIResponseError.badResponse(response)
      completionClosure(APIResponseResult.failure(badResponse))
    }
  }

  // MARK: - Process Failure
  func processFailedRequest(withError failureError: Error?) -> Void {
    //TODO: Process Error
    completionClosure(APIResponseResult.failure(APIResponseError.native(failureError)))
  }

  // MARK: - Filtering Non-allowed Results
  private func filterOnlytracks(from results: ItunesSearchTransformResponseObject.TransformType) -> ItunesSearchTransformResponseObject.TransformType {
    return results.filter({ (element) -> Bool in
      guard let wrapperType = element["wrapperType"] as? String else {
        return false
      }
      return wrapperType == "track"
    })
  }
}
