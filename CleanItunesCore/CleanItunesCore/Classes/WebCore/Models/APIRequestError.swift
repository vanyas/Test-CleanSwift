//
//  APIRequestError.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

/**
 Enlists the kind of errors that can be throwed throughout the
 process of creating a `RCORequestable` instance.

 - invalidHost: throwed when the required host URL cannot be retrieved/found.
 - missingParameters: throwed when required parameters are missing.
 **/
public enum APIRequestError: Error {

  case invalidHost
  case missingParameters
}
