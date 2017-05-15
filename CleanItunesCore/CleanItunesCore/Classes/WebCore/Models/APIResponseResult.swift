//
//  APIResponseResult.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

import Foundation

/**
 Represents the kind of result obtanied form a Web API request call.
 - success: A successful response, containing the resultant object deserialized
 - failure: An unsuccessful response, including the specific kind of error.
 - SeeAlso: `RCOAPIResponseError.swift`
 */
public enum APIResponseResult<T> {
  case success(T)
  case failure(APIResponseError)
}
