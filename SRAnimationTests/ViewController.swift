//
//  ViewController.swift
//  SRAnimationTests
//
//  Created by Louis Tur on 6/13/16.
//  Copyright © 2016 catthoughts. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = Colors.SkyBlue
    
    self.view.addSubview(backgroundView)
    self.backgroundView.snp_makeConstraints { (make) in
      make.edges.equalTo(self.view)
    }
  }
  
  internal lazy var backgroundView: InitialMonkeyView = {
    let view: InitialMonkeyView = InitialMonkeyView()
    return view
  }()
}

class InitialMonkeyView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(groundView)
    self.addSubview(playgroundImageView)
    
    self.groundView.snp_makeConstraints { (make) in
      make.left.bottom.right.width.equalTo(self)
      make.height.equalTo(238.0)
    }
    
    self.playgroundImageView.snp_makeConstraints { (make) in
      make.centerX.centerY.equalTo(self)
    }

  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  internal lazy var groundView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = Colors.GroundGreen
    return view
  }()
  
  internal lazy var playgroundImageView: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "playground_1"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
}