//
//  ViewController.swift
//  SRAnimationTests
//
//  Created by Louis Tur on 6/13/16.
//  Copyright © 2016 catthoughts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = Colors.SkyBlue
    
    self.view.addSubview(groundView)
    
    
  }

  internal lazy var groundView: UIView = {
  let view: UIView = UIView()
  view.backgroundColor = Colors.GroundGreen
  return view
  }()

}

