//
//  ValidateResponseObject.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/16/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

protocol TransformResponseObject {

  associatedtype TransformType

  func transFormResponseObject(_ response: Any?) throws -> TransformType
}
