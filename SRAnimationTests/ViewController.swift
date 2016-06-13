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
    
    self.view.addSubview(scrollingView)
    self.scrollingView.addSubview(scene1)
    self.scrollingView.addSubview(scene2)
    
    
    self.scrollingView.snp_makeConstraints { (make) in
      make.edges.equalTo(self.view)
    }
    
    self.scene1.snp_makeConstraints { (make) in
      make.left.top.equalTo(self.scrollingView)
      make.width.height.equalTo(self.view)
    }
    
    self.scene2.snp_makeConstraints { (make) in
      make.left.equalTo(self.scene1.snp_right)
      make.top.width.height.equalTo(self.scene1)
      make.right.equalTo(self.scrollingView)
    }
  }
  
  internal lazy var scene1: InitialMonkeyView = {
    let view: InitialMonkeyView = InitialMonkeyView()
    return view
  }()
  
  internal lazy var scene2: SecondMonkeyView = {
    let view: SecondMonkeyView = SecondMonkeyView()
    return view
  }()
  
  internal lazy var scrollingView: UIScrollView = {
    let scrolling: UIScrollView = UIScrollView()
    scrolling.pagingEnabled = true
    scrolling.alwaysBounceVertical = false
    scrolling.alwaysBounceHorizontal = true
    return scrolling
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




class SecondMonkeyView: InitialMonkeyView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(monkeyImageView)
    self.playgroundImageView.image = UIImage(named: "playground_2")
    
    self.monkeyImageView.snp_makeConstraints { (make) in
      make.centerX.equalTo(self)
      make.bottom.equalTo(self.groundView.snp_centerY)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  internal lazy var monkeyImageView: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "waving_monkey"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
}