//
//  APIResponseError.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

/**
 Enlists the different kind of response errors handled by the library.

 - jsonMapping:   Throwed when the response couldn't be deserialized into an object
 - businessLogic: Throwed when the request does not fulfill the business logic requirements
 - statusCode:    Throwed when the status code isn't between the `200..<300` range
 - badResponse:   Throwed when the response cannnot be casted as ``[String: AnyObject]``
 - native:        Throwed when only the standar NSError was received
 */
public enum APIResponseError: Error {

  case jsonMapping
  case businessLogic
  case statusCode(Int)
  case badResponse(Any?)
  case native(Swift.Error?)
}
