//
//  WebAPIClient.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import Alamofire

public typealias APICompletion<T> = (APIResponseResult<T>) -> Void

public class WebAPIClient {

  // MARK: - Generic Request
  func request<RequestType, ResponseType>(_ APIRequest: RequestType,
    responseHandler: ResponseType) -> Void
    where RequestType: Requestable, ResponseType: Responseable {
      var url = APIRequest.baseURL
      if let path = APIRequest.path {
        url = url.appendingPathComponent(path)
      }

      Alamofire.request(url,
       method: alamofireHTTPMethod(from: APIRequest.method),
       parameters: APIRequest.parameters,
       headers: APIRequest.headers
      ).responseJSON { (response) in
        guard response.error == nil else {
          responseHandler.processFailedRequest(withError: response.error)
          return
        }
        responseHandler.processSucceededRequest(withResponse: response.value)
     }
  }
}

// MARK: - Alamofire bridge
extension WebAPIClient {

  fileprivate func alamofireHTTPMethod(from requestMethod: APIRequestMethod) -> Alamofire.HTTPMethod {
    switch requestMethod {
      case .get:
        return Alamofire.HTTPMethod.get
      case .post:
        return Alamofire.HTTPMethod.post
    }
  }
}