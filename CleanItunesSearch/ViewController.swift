//
//  ViewController.swift
//  CleanItunesSearch
//
//  Created by Vangeli Ontiveros on 5/10/17.
//  Copyright © 2017 WDPRO. All rights reserved.
//

import UIKit
import CleanItunesCore

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib
    let url = URL(string: "https://itunes.apple.com")!
    let webService = WebAPIServicesFactory.createItunesSearchWebService(for: url)

    do {
      try webService.searchContent(by: "Star Wars") { (response) in
        switch response {
        case .failure(let error):
          print("\(error)")
        case .success(let results):
          print("\(results)")
        }
      }
    } catch {
      print(error)
    }

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

