//
//  SearchItunesTableViewController.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import UIKit

class SearchItunesTableViewController: UITableViewController {

  // MARK: - Public Properties
  var output: SearchItunesViewInteractorBoundary!
  var searchResults: [SearchItunesScene.SearchByTerm.ViewModel.DisplayedResult] = []

  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    SearchItunesConfigurator.sharedInstance.configure(viewController: self)
    configureTableView()

    // Start Request
    let request = SearchItunesScene.SearchByTerm.Request(term: "Alien")
    output.searchItunes(request: request)
  }

  private func configureTableView() {
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 86.0
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: SearchItunesSceneConstants.TableViewCellIdentifiers.displayItunesResult.rawValue,
      for: indexPath) as! DisplayItunesResultTableViewCell

    let result = searchResults[indexPath.row]
    cell.resultImageView?.image = UIImage(named: SearchItunesSceneConstants.ImageCatalog.resultPlaceHolder.rawValue)
    cell.resultTitleLabel.text = result.title
    cell.resultAuthorLabel.text = result.author

    return cell
  }
}

// MARK: - SearchItunesPresenterViewBoundary Implementation
extension SearchItunesTableViewController: SearchItunesPresenterViewBoundary {

  func displayFetchedResults(viewModel: SearchItunesScene.SearchByTerm.ViewModel) {
    searchResults = viewModel.displayedResults
    tableView.reloadData()
  }
}
