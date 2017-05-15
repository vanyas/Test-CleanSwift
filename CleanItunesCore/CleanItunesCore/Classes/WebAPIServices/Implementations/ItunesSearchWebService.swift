//
//  ItunesSearchWebService.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public class ItunesSearchWebService: ItunesSearchableAPI {
  // MARK: - Properties
  private let webAPIClient: WebAPIClient
  private let requestAdapter: ItunesSearchRequestAdapter

  // MARK: - Initializer
  init(using webAPIClient: WebAPIClient,
       requestAdapter: ItunesSearchRequestAdapter) {
    self.webAPIClient = webAPIClient
    self.requestAdapter = requestAdapter
  }

  // MARK: - ItunesSearchableAPI Implementation
  public func searchContent(by term: String, searchMedia: SearchMedia, completion: @escaping (APIResponseResult<SearchResult>) -> Void) throws {
    // TODO: Implement Code
    
  }

  public func searchContent(by term: String, completion: @escaping (APIResponseResult<SearchResult>) -> Void) throws {
    // TODO: Implement Code
  }

}
