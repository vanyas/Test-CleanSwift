//
//  ValidateResponseError.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/17/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

protocol ValidateResponseError {

  func processResponseError(_ error: Error?) -> APIResponseError
}
