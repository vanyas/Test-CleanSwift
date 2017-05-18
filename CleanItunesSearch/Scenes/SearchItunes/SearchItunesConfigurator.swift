//
//  SearchItunesConfigurator.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import Foundation

class SearchItunesConfigurator {

  // MARK: - SharedInstance
  static let sharedInstance = SearchItunesConfigurator()

  // MARK: - Configure
  func configure(viewController: SearchItunesTableViewController) {
    let interactor = SearchItunesInteractor()
    let presenter = SearchItunesPresenter()

    viewController.output = interactor
    interactor.output = presenter
    presenter.output = viewController
  }
}
