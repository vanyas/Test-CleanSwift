//
//  WebAPIServicesFactory.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

public class WebAPIServicesFactory {
  public static func createItunesSearchWebService(for baseURL: URL) -> ItunesSearchWebService {
    let requestAdapter = ItunesSearchRequestAdapter(baseURL: baseURL)
    let webAPIClient = WebAPIClient.defaultClient
    return ItunesSearchWebService(using: webAPIClient, requestAdapter: requestAdapter)
  }
}
