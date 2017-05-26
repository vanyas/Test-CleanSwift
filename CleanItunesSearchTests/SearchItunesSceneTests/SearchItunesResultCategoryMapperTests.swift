//
//  SearchItunesResultCategoryMapperTests.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/26/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import XCTest
@testable import CleanItunesSearch

class SearchItunesResultCategoryMapperTests: XCTestCase {

  //  MARK: Properties
  var categoryMapper: SearchItunesResultCategoryMappable!
    
  override func setUp() {
    super.setUp()
    categoryMapper = SearchItunesResultCategoryMapper()
  }

  //  MARK: Tests

  func testMapCategory_forAllSupportedResultKinds_shouldMapAllResults() {
    // Setup
    let allSupportedKinds = categoryMapper.supportedResultKinds

    //Test
    let mappedCategories = allSupportedKinds.map({
      return categoryMapper.mapCategory(from: $0)
    })

    let mappedOtherCategory = mappedCategories.contains("Other")

    // Verify
    XCTAssertFalse(mappedOtherCategory, "Mapping for allSupportedKinds containes an 'Other' category.")
  }

  func testMapCategory_forUnsupportedResultKind_shouldMapToOtherCategory() {
    // Setup
    let unsupportedKind = "unknown"

    //Test
    let mappedCategory = categoryMapper.mapCategory(from: unsupportedKind)

    // Verify
    XCTAssertEqual("Other", mappedCategory,"Mapping of unsupported result kind should return 'Other' category.") 
  }

}
