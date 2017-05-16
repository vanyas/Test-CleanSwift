//
//  ItunesSearchValidateResponseObject.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/16/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

class ItunesSearchTransformResponseObject: TransformResponseObject {

  // MARK: - TransformResponseObject Properties
  typealias TransformType = [[String: Any]]

  // MARK: - Private Constans
  let kResults = "results"

  // MARK: - TransformResponseObject Implementation
  func transFormResponseObject(_ response: Any?) throws -> [[String: Any]] {
    guard let JSONDictionary = response as? [String: Any],
          let results = JSONDictionary[kResults] as? [[String: Any]] else {
      throw APIResponseError.jsonMapping
    }
    return results
  }

}
