//
//  ItunesSearchResponseHandlerTests.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/16/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesCore
import Alamofire

class ItunesSearchResponseHandlerTests: XCTestCase {
    
  // MARK: - Properties
  var responseHandler: ItunesSearchResponseHandler!
  private var responseSpy: SpyItunesSearchResponseHandler!

  // MARK: - Setup
  override func setUp() {
    super.setUp()
    responseSpy = SpyItunesSearchResponseHandler()
    setupResponseHandler()
  }

  func setupResponseHandler() {
    responseHandler = ItunesSearchResponseHandler(
      withCompletion: responseSpy.spyCompletionClosure()
    )
  }

  // MARK: - Load Sample Data
  func loadSampleData() -> Any {
    let bundle = Bundle(for: type(of: self))
    let url = bundle.url(forResource: "search_results", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    let reponseJSON = try! JSONSerialization.jsonObject(
      with: data,
      options: []
    )
    return reponseJSON
  }

  // MARK: - processSucceededRequest Tests
  func testProcessSucceededRequest_withValidResponse_resultShouldBeSuccessful() {
    // Setup
    let responseJSON = loadSampleData()

    //Test
    responseHandler.processSucceededRequest(withResponse: responseJSON)

    //Verify
    XCTAssertTrue(responseSpy.resultWasSuccessful, "Result should have been successful")
  }

  func testProcessSucceededRequest_withWrongJSONStructure_resultShouldFailWithJSONMappingError() {
    // Setup
    let responseJSON = ["wrong": "JSON"]

    //Test
    responseHandler.processSucceededRequest(withResponse: responseJSON)

    //Verify
    XCTAssertTrue(responseSpy.resultWasFailure, "Result should have been failed")

    guard case APIResponseError.jsonMapping = responseSpy.responseError! else {
      XCTFail("Unexpected APIResponseError \(String(describing: responseSpy.responseError))")
      return
    }
  }

  func testProcessSucceededRequest_withMissing_resultShouldFailWithJSONMappingError() {
    // Setup
    var responseJSON = loadSampleData() as! [String: Any]
    let results = (responseJSON["results"] as! [[String: Any]]).map { element -> Any in
      var incomplete = element
      incomplete.removeValue(forKey: "kind")
      return incomplete
    }
    responseJSON["results"] = results
    //Test
    responseHandler.processSucceededRequest(withResponse: responseJSON)

    //Verify
    XCTAssertTrue(responseSpy.resultWasFailure, "Result should have failed")

    guard case APIResponseError.jsonMapping = responseSpy.responseError! else {
      XCTFail("Unexpected APIResponseError \(String(describing: responseSpy.responseError))")
      return
    }
  }

  func testProcessFailedRequest_resultShouldBeFailed() {
    // Setup
    /* Nothing */

    //Test
    responseHandler.processFailedRequest(withError: nil)

    //Verify
    XCTAssertTrue(responseSpy.resultWasFailure, "Result should have been failed")
  }

  func testProcessFailedRequest_withInvalidStatusCode_resultShouldBeFailed() {
    // Setup
    let statusCodeError = AFError.ResponseValidationFailureReason.unacceptableStatusCode(code: 404)
    let validationError = AFError.responseValidationFailed(reason: statusCodeError)

    //Test
    responseHandler.processFailedRequest(withError: validationError)

    //Verify
    XCTAssertTrue(responseSpy.resultWasFailure, "Result should have been failed")
    guard case APIResponseError.statusCode(_) = responseSpy.responseError! else {
      XCTFail("Unexpected APIResponseError \(String(describing: responseSpy.responseError))")
      return
    }
  }

  func testProcessFailedRequest_withSerializationError_resultShouldBeFailed() {
    // Setup
    let dummyError = NSError(domain: "testError", code: 1000, userInfo: nil) as Error
    let jsonError = AFError.ResponseSerializationFailureReason.jsonSerializationFailed(
      error: dummyError
    )
    let serializationError = AFError.responseSerializationFailed(reason: jsonError)

    //Test
    responseHandler.processFailedRequest(withError: serializationError)

    //Verify
    XCTAssertTrue(responseSpy.resultWasFailure, "Result should have been failed")
    guard case APIResponseError.jsonMapping = responseSpy.responseError! else {
      XCTFail("Unexpected APIResponseError \(String(describing: responseSpy.responseError))")
      return
    }
  }
}

// MARK: - ItunesSearchResponseHandler Spy
private class SpyItunesSearchResponseHandler {

  // MARK: - Properties
  var resultWasSuccessful = false
  var resultWasFailure = false

  var responseError: APIResponseError?
  var searchResults: [SearchResult]?

  func spyCompletionClosure() -> APICompletion<[SearchResult]> {
    return { [unowned self] result in
      switch result {
        case .failure(let error):
          self.resultWasFailure = true
          self.responseError = error
        case .success(let results):
          self.resultWasSuccessful = true
          self.searchResults = results
      }
    }
  }
}
