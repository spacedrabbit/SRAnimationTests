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
    self.clipsToBounds = true
    
    self.addSubview(pageControl)
    self.addSubview(groundView)
    self.addSubview(cloud1)
    self.addSubview(cloud2)
    self.addSubview(sceneLabel)
    
    self.cloud1.transform = CGAffineTransformMakeScale(-1.0, 1.0)
    
    self.addSubview(playgroundImageView)
    self.addSubview(monkeyImageView)
    self.addSubview(groundShadow)
    
    self.sceneLabel.font = UIFont.systemFontOfSize(24.0, weight: UIFontWeightSemibold)
    self.sceneLabel.text = "Little monkeys can be\na bit rambunctious."
    self.pageControl.numberOfPages = 3
    self.pageControl.currentPage = 0
    
    self.groundView.snp_makeConstraints { (make) in
      make.left.bottom.right.width.equalTo(self)
      make.height.equalTo(238.0)
    }
    
    self.pageControl.snp_makeConstraints { (make) in
      make.centerX.equalTo(self)
      make.centerY.equalTo(self.snp_top).offset(40.0)
    }
    
    self.playgroundImageView.snp_makeConstraints { (make) in
      make.centerX.centerY.equalTo(self)
    }
    
    self.monkeyImageView.snp_makeConstraints { (make) in
      make.right.equalTo(self.playgroundImageView.snp_centerX)
      make.top.equalTo(self.playgroundImageView.snp_top).multipliedBy(1.6)
    }

    self.cloud1.snp_makeConstraints { (make) in
      make.centerY.equalTo(self.playgroundImageView.snp_top).multipliedBy(1.25)
      make.centerX.equalTo(self.playgroundImageView.snp_left)
    }
    
    self.cloud2.snp_makeConstraints { (make) in
      make.bottom.equalTo(self.cloud1.snp_top)
      make.centerX.equalTo(self.playgroundImageView.snp_right)
    }
    
    self.sceneLabel.snp_makeConstraints { (make) in
      make.centerX.equalTo(self)
      make.top.equalTo(self).offset(80.0)
      make.width.lessThanOrEqualTo(self)
    }
    
    self.groundShadow.snp_makeConstraints { (make) in
      make.centerX.equalTo(self.monkeyImageView.snp_centerX)
      make.top.equalTo(self.playgroundImageView.snp_bottom).offset(8.0)
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
  
  internal lazy var groundShadow: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "ground_shadow"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
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
  
  internal lazy var cloud1: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "cloud_1"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
  
  internal lazy var cloud2: UIImageView = {
    let imageView: UIImageView = UIImageView(image: UIImage(named: "cloud_2"))
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
  
  internal lazy var sceneLabel: UILabel = {
    let label: UILabel = UILabel()
    label.textColor = UIColor.whiteColor()
    label.font = UIFont.systemFontOfSize(24.0, weight: UIFontWeightRegular)
    label.numberOfLines = 2
    label.textAlignment = .Center
    return label
  }()
  
  internal lazy var pageControl: UIPageControl = UIPageControl()
}




class SecondMonkeyView: InitialMonkeyView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(iphoneImageView)
    self.playgroundImageView.image = UIImage(named: "playground_2")
    self.monkeyImageView.image = UIImage(named: "waving_monkey")
    self.groundShadow.removeFromSuperview()
    self.pageControl.currentPage = 1
    
    self.sceneLabel.font = UIFont.systemFontOfSize(24.0, weight: UIFontWeightRegular)
    self.sceneLabel.text = "The Monkey app is a wireless\nbond with your child."
    
    self.monkeyImageView.snp_remakeConstraints { (make) in
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
    
    self.cloud2.snp_remakeConstraints { (make) in
      make.centerY.equalTo(self.snp_top).offset(238.0)
      make.centerX.equalTo(self.monkeyImageView.snp_right).inset(12.0)
    }
    
    self.cloud1.snp_remakeConstraints { (make) in
      make.top.equalTo(self.cloud2.snp_bottom).offset(24.0)
      make.right.equalTo(self.playgroundImageView.snp_left).offset(12.0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}



class ThirdMonkeyView: InitialMonkeyView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(iphoneImageView)
    
    self.playgroundImageView.image = UIImage(named: "playground_2")
    self.iphoneImageView.image = UIImage(named: "iphone_yellow")
    self.monkeyImageView.image = UIImage(named: "swinging_monkey")
    self.pageControl.currentPage = 1
    self.groundShadow.removeFromSuperview()
    
    self.sceneLabel.font = UIFont.systemFontOfSize(24.0, weight: UIFontWeightRegular)
    self.sceneLabel.text = "As your monkeys play,\nMonkey keeps an eye on them."
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
    
    self.cloud2.snp_remakeConstraints { (make) in
      make.centerY.equalTo(self.snp_top).offset(238.0)
      make.centerX.equalTo(self.playgroundImageView.snp_left)
    }
    
    self.cloud1.snp_remakeConstraints { (make) in
      make.top.equalTo(self.cloud2.snp_bottom).offset(24.0)
      make.centerX.equalTo(self.groundView.snp_right).inset(12.0)
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
    self.monkeyImageView.hidden = true
    self.pageControl.currentPage = 1
    self.groundShadow.removeFromSuperview()
    
    self.playgroundImageView.image = UIImage(named: "playground_2")
    self.iphoneImageView.image = UIImage(named: "iphone_red")
    
    self.sceneLabel.font = UIFont.systemFontOfSize(24.0, weight: UIFontWeightRegular)
    self.sceneLabel.text = "If your monkey strays too far,\n you're alerted fast."
    
    self.playgroundImageView.snp_remakeConstraints { (make) in
      make.centerX.equalTo(self.groundView.snp_centerX).dividedBy(2.0)
      make.bottom.equalTo(self.groundView.snp_top).offset(24.0)
    }
    
    self.iphoneImageView.snp_makeConstraints { (make) in
      make.left.equalTo(playgroundImageView.snp_left).offset(8.0)
      make.top.equalTo(self.groundView.snp_centerY).inset(8.0)
    }
    
    self.cloud1.snp_remakeConstraints { (make) in
      make.centerY.equalTo(self.snp_top).offset(238.0)
      make.centerX.equalTo(self.playgroundImageView.snp_right).offset(-12.0)
    }
    
    self.cloud2.snp_remakeConstraints { (make) in
      make.top.equalTo(self.cloud1.snp_bottom).offset(24.0)
      make.left.equalTo(self.cloud1.snp_right).inset(2.0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}


class FifthMonkeyView: InitialMonkeyView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(treeImageView)
    self.addSubview(button)
    
    self.playgroundImageView.hidden = true
    self.iphoneImageView.hidden = true
    self.pageControl.currentPage = 2
    self.groundShadow.removeFromSuperview()
    
    self.monkeyImageView.image = UIImage(named: "cheeky_monkey")
    self.sceneLabel.font = UIFont.systemFontOfSize(24.0, weight: UIFontWeightRegular)
    self.sceneLabel.text = "With Monkey, you can\nlet your monkeys run free."
    
    self.treeImageView.snp_makeConstraints { (make) in
      make.bottom.equalTo(self.groundView.snp_top).offset(12.0)
      make.left.equalTo(self.groundView).offset(12.0)
    }
    
    self.monkeyImageView.snp_remakeConstraints { (make) in
      make.centerX.equalTo(self.groundView.snp_centerX)
      make.centerY.equalTo(self.groundView.snp_top)
    }
    
    self.button.snp_makeConstraints { (make) in
      make.left.right.bottom.equalTo(self.groundView).inset(8.0)
      make.height.equalTo(75.0)
    }
    
    self.cloud1.snp_remakeConstraints { (make) in
      make.centerY.equalTo(self.snp_top).offset(238.0)
      make.centerX.equalTo(self.monkeyImageView.snp_right)
    }
    
    self.cloud2.snp_remakeConstraints { (make) in
      make.top.equalTo(self.cloud1.snp_bottom).offset(24.0)
      make.right.equalTo(self.treeImageView.snp_right).inset(2.0)
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