//
//  Responseable.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

/**
 A protocol that defines the structure that a type must conform so that can be
 used by the `RCOWebAPIClient` in order to *handle* the response received from
 an HTTPRequest.
 */
public protocol Responseable {

  /// The type of response used as the `.success(T)` in the `RCOCompletion` closure
  associatedtype ResponseType

  /**
   The completion closure that will be exceuted once the response is processed,
   either it fails or succeeds
   */
  var completionClosure: APICompletion<ResponseType> { get }

  /**
   Process the response received form an httpRequest (if any)
   - parameter response: The response object received from an httpRequest

   - note: There's no guarantee that the response type (Any?) is a valid response
   for the API. This method will be responsible for evaluate that the
   object satisfies the business logic of the expected result.
   */
  func processSucceededRequest(withResponse response:Any?) -> Void

  /**
   Process the failure received form an httpRequest (if any).
   This method would evaluate the `Error` type received from a failed httpRequest
   and if it is necessary, provide a more contextualized error about why the request
   failed.
   - parameter failureError: An Error type received from an httpRequest
   - seealso: `RCOAPIResponseError`
   */
  func processFailedRequest(withError failureError: Error?) -> Void
}
