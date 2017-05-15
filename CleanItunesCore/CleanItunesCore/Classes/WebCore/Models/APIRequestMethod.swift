//
//  APIRequestMethod.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/12/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

/**
 Enlists the method verb that belongs to an RCORequestable.
 - get:     An HTTPRequest *GET* request
 - post:    An HTTPRequest *POST* request
 */
enum APIRequestMethod {
  case get
  case post
}
