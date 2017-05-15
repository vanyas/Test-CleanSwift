//
//  MockWebAPIClient.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/15/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation
@testable import CleanItunesCore

class MockWebAPIClient: WebAPIClient {

  // MARK: - Properties
  var errorValue: APIResponseError?
  var responseValue: Any?
  var delayTime = 3

  // MARK: - Verifiers
  var processFailureWasCalled = false
  var processSuccesWasCalled = false

  override func request<RequestType, ResponseType>(_ APIRequest: RequestType, responseHandler: ResponseType)
    where RequestType : Requestable, ResponseType : Responseable {
    let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(delayTime)
    DispatchQueue.main.asyncAfter(deadline: deadline) { [unowned self] in
      guard self.errorValue == nil else {
        self.processFailureWasCalled = true
        responseHandler.processFailedRequest(withError: self.errorValue)
        return
      }
      self.processSuccesWasCalled = true
      responseHandler.processSucceededRequest(withResponse: self.responseValue)
    }
  }
}
