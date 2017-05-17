//
//  ItunesSearchValidateResponseError.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/17/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
import Alamofire

class ItunesSearchValidateResponseError: ValidateResponseError {
  func processResponseError(_ error: Error?) -> APIResponseError {
    guard let alamofireError = error as? AFError else {
      return APIResponseError.native(error)
    }

    switch alamofireError {
      case .responseValidationFailed(reason: .unacceptableStatusCode(code: let statusCode)):
        return APIResponseError.statusCode(statusCode)
      case .responseSerializationFailed(reason: .jsonSerializationFailed(error: _)):
        return APIResponseError.jsonMapping
      default:
        return APIResponseError.badResponse(alamofireError.errorDescription)
    }
  }
}
