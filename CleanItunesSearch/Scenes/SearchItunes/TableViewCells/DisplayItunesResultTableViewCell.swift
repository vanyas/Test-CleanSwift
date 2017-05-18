//
//  DisplayItunesResultTableViewCell.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/18/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import UIKit

class DisplayItunesResultTableViewCell: UITableViewCell {

  // MARK: - Outlets
  @IBOutlet weak var resultImageView: UIImageView!
  @IBOutlet weak var resultTitleLabel: UILabel!
  @IBOutlet weak var resultAuthorLabel: UILabel!

  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }
}
