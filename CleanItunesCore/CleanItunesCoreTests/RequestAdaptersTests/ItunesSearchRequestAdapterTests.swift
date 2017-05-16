//
//  ItunesSearchRequestAdapterTests.swift
//  CleanItunesCore
//
//  Created by Vangeli Ontiveros on 5/16/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesCore

class ItunesSearchRequestAdapterTests: XCTestCase {

  // MARK: - Properties
  var searchRequestAdapter: ItunesSearchRequestAdapter!

  // MARK: - Setup
  override func setUp() {
    super.setUp()
    let baseURL = URL(string: "https://test.com")!
    searchRequestAdapter = ItunesSearchRequestAdapter(baseURL: baseURL)
  }

  // MARK: - newSearchContent tests
  func testNewSearchContent_withValidTerm_shouldReturnItunesSearchRequest() {
    // Setup
    let term = "test term"

    // Test
    do {
      let request = try searchRequestAdapter.newSearchContent(
        by: term,
        searchMedia: nil
      )

      //Verify
      XCTAssertEqual(request.parameters!["term"] as! String, term)
      XCTAssertNil(request.parameters!["media"])
      XCTAssertNil(request.parameters!["entity"])
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }

  func testNewSearchContent_withEmptyTerm_shouldThrowMissingParameters() {
    // Setup
    let term = ""

    // Test
    do {
      let request = try searchRequestAdapter.newSearchContent(
        by: term,
        searchMedia: nil
      )
      //Verify
      XCTFail("Unexpected successful request: \(request)")
    } catch APIRequestError.missingParameters {
      /* Successful APIRequestError Thrown */
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }

  func testNewSearchContent_withValidTerm_AndMediaType_shouldReturnItunesSearchRequest() {
    // Setup
    let term = "test term"
    let searchMedia = SearchMedia(media: SearchMedia.MediaType.movie)

    // Test
    do {
      let request = try searchRequestAdapter.newSearchContent(
        by: term,
        searchMedia: searchMedia
      )

      //Verify
      XCTAssertEqual(request.parameters!["term"] as! String, term)
      XCTAssertEqual(request.parameters!["media"] as! String, searchMedia.media.rawValue)
      XCTAssertNil(request.parameters!["entity"])
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }

  func testNewSearchContent_withValidTerm_MediaType_AndEntityType_shouldReturnItunesSearchRequest() {
    // Setup
    let term = "test term"
    let searchMedia = SearchMedia(
      media: SearchMedia.MediaType.movie,
      entity: SearchMedia.EntityType.musicTrack)

    // Test
    do {
      let request = try searchRequestAdapter.newSearchContent(
        by: term,
        searchMedia: searchMedia
      )

      //Verify
      XCTAssertEqual(request.parameters!["term"] as! String, term)
      XCTAssertEqual(request.parameters!["media"] as! String, searchMedia.media.rawValue)
      XCTAssertEqual(request.parameters!["entity"] as! String, searchMedia.entity!.rawValue)
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }
}
