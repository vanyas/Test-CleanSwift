//
//  Requestable.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

protocol Requestable {
  /// The base URL that includes the host part of the request
  var baseURL: URL { get }
  /// The path that'll be appended to the baseURL (optional).
  var path: String? { get }
  /// The parameters of the request
  var parameters: [String: Any]? { get }
  /// The method (verb) of the request
  var method: APIRequestMethod { get }
  /// The headers that should be included in the request
  var headers: [String: String]? { get }
}
