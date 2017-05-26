//
//  SearchItunesTableViewController.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import UIKit
import Kingfisher

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
    let request = SearchItunesScene.SearchByTerm.Request(term: "Batman")
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
    configureImageView(for: cell, withURL: result.imageURL)
    cell.resultTitleLabel.text = result.title
    cell.resultAuthorLabel.text = result.author

    return cell
  }

  fileprivate func configureImageView(for cell: DisplayItunesResultTableViewCell, withURL: URL?) {
    let defaultImage = UIImage(named: SearchItunesSceneConstants.ImageCatalog.resultPlaceHolder.rawValue)
    guard let url = withURL else {
      cell.resultImageView.image = defaultImage
      return
    }

    let processor = RoundCornerImageProcessor(cornerRadius: 16)
    let options: KingfisherOptionsInfo = [
      .processor(processor),
      .transition(.fade(0.2))
    ]

    cell.resultImageView.kf.indicatorType = .activity
    cell.resultImageView.kf.setImage(
      with: url,
      placeholder: defaultImage,
      options: options,
      progressBlock: nil,
      completionHandler: { [weak cell] (image, downloadError, cacheType, url) in
        guard downloadError == nil else {
          cell?.resultImageView?.kf.indicatorType = .none
          return
        }
      }
    )
  }
}

// MARK: - SearchItunesPresenterViewBoundary Implementation
extension SearchItunesTableViewController: SearchItunesPresenterViewBoundary {

  func displayFetchedResults(viewModel: SearchItunesScene.SearchByTerm.ViewModel) {
    searchResults = viewModel.displayedResults
    tableView.reloadData()
  }
}
