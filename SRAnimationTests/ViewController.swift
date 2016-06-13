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
    self.scrollingView.addSubview(scene3)
    self.scrollingView.addSubview(scene4)
    self.scrollingView.addSubview(scene5)
    
    
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
    }
    
    self.scene3.snp_makeConstraints { (make) in
      make.left.equalTo(self.scene2.snp_right)
      make.top.width.height.equalTo(self.scene1)
    }
    
    self.scene4.snp_makeConstraints { (make) in
      make.left.equalTo(self.scene3.snp_right)
      make.top.width.height.equalTo(self.scene1)
    }
    
    self.scene5.snp_makeConstraints { (make) in
      make.left.equalTo(self.scene4.snp_right)
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
  
  internal lazy var scene3: ThirdMonkeyView = {
    let view: ThirdMonkeyView = ThirdMonkeyView()
    return view
  }()
  
  
  internal lazy var scene4: FourthMonkeyView = FourthMonkeyView()
  internal lazy var scene5: FifthMonkeyView = FifthMonkeyView()
  
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
    self.addSubview(monkeyImageView)
    
    self.groundView.snp_makeConstraints { (make) in
      make.left.bottom.right.width.equalTo(self)
      make.height.equalTo(238.0)
    }
    
    self.playgroundImageView.snp_makeConstraints { (make) in
      make.centerX.centerY.equalTo(self)
    }
    
    self.monkeyImageView.snp_makeConstraints { (make) in
      make.right.equalTo(self.playgroundImageView.snp_centerX)
      make.top.equalTo(self.playgroundImageView.snp_top).multipliedBy(1.6)
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
  
  internal lazy var iphoneImageView: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "iphone_green"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
  
  internal lazy var monkeyImageView: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "swinging_monkey"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
}




class SecondMonkeyView: InitialMonkeyView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(iphoneImageView)
    self.playgroundImageView.image = UIImage(named: "playground_2")
    self.monkeyImageView.image = UIImage(named: "waving_monkey")
    
    self.monkeyImageView.snp_makeConstraints { (make) in
      make.centerX.equalTo(self)
      make.bottom.equalTo(self.groundView.snp_centerY)
    }
    
    self.playgroundImageView.snp_remakeConstraints { (make) in
      make.centerX.equalTo(self.groundView.snp_centerX).dividedBy(2.0)
      make.bottom.equalTo(self.groundView.snp_top).offset(24.0)
    }
    
    self.iphoneImageView.snp_makeConstraints { (make) in
      make.left.equalTo(playgroundImageView.snp_left).offset(8.0)
      make.top.equalTo(self.groundView.snp_centerY).inset(8.0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  

}



class ThirdMonkeyView: InitialMonkeyView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(monkeyImageView)
    self.addSubview(iphoneImageView)
    
    self.playgroundImageView.image = UIImage(named: "playground_2")
    self.iphoneImageView.image = UIImage(named: "iphone_yellow")
    self.monkeyImageView.image = UIImage(named: "swinging_monkey")
    
    self.monkeyImageView.transform = CGAffineTransformMakeScale(-1.0, 1)
    
    self.monkeyImageView.snp_remakeConstraints { (make) in
      make.left.equalTo(self.playgroundImageView.snp_right).inset(8.0)
      make.top.equalTo(self.playgroundImageView.snp_top).offset(8.0)
      make.width.height.equalTo(70.0)
    }
    
    self.playgroundImageView.snp_remakeConstraints { (make) in
      make.centerX.equalTo(self.groundView.snp_centerX).dividedBy(2.0)
      make.bottom.equalTo(self.groundView.snp_top).offset(24.0)
    }
    
    self.iphoneImageView.snp_makeConstraints { (make) in
      make.left.equalTo(playgroundImageView.snp_left).offset(8.0)
      make.top.equalTo(self.groundView.snp_centerY).inset(8.0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}


class FourthMonkeyView: InitialMonkeyView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(iphoneImageView)
    self.playgroundImageView.image = UIImage(named: "playground_2")
    self.iphoneImageView.image = UIImage(named: "iphone_red")
    
    self.playgroundImageView.snp_remakeConstraints { (make) in
      make.centerX.equalTo(self.groundView.snp_centerX).dividedBy(2.0)
      make.bottom.equalTo(self.groundView.snp_top).offset(24.0)
    }
    
    self.iphoneImageView.snp_makeConstraints { (make) in
      make.left.equalTo(playgroundImageView.snp_left).offset(8.0)
      make.top.equalTo(self.groundView.snp_centerY).inset(8.0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}


class FifthMonkeyView: InitialMonkeyView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(monkeyImageView)
    self.addSubview(treeImageView)
    self.addSubview(button)
    
    self.playgroundImageView.hidden = true
    self.iphoneImageView.hidden = true
    
    self.monkeyImageView.image = UIImage(named: "cheeky_monkey")
    
    self.treeImageView.snp_makeConstraints { (make) in
      make.bottom.equalTo(self.groundView.snp_top).offset(12.0)
      make.left.equalTo(self.groundView).offset(12.0)
    }
    
    self.monkeyImageView.snp_makeConstraints { (make) in
      make.centerX.equalTo(self.groundView.snp_centerX)
      make.centerY.equalTo(self.groundView.snp_top)
    }
    
    self.button.snp_makeConstraints { (make) in
      make.left.right.bottom.equalTo(self.groundView).inset(8.0)
      make.height.equalTo(75.0)
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  internal lazy var treeImageView: UIImageView = {
    let imageView: UIImageView = UIImageView()
    imageView.image = UIImage(named: "trees")
    return imageView
  }()
  
  internal lazy var button: UIButton = {
    let button: UIButton = UIButton(type: .Custom)
    button.backgroundColor = Colors.ButtonBlue
    button.setTitle("Add a Monkey", forState: .Normal)
    button.layer.cornerRadius = 4.0
    button.clipsToBounds = true
    return button
  }()
  
}