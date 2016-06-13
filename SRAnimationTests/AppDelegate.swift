//
//  AppDelegate.swift
//  SRAnimationTests
//
//  Created by Louis Tur on 6/13/16.
//  Copyright © 2016 catthoughts. All rights reserved.
//

import UIKit

internal struct Colors {
  static let BaseOrange: UIColor = UIColor(red: 245.0/255.0, green: 134.0/255.0, blue: 45.0/255.0, alpha: 1.0)
  static let BaseYellow: UIColor = UIColor(red: 254.0/255.0, green: 202.0/255.0, blue: 81.0/255.0, alpha: 1.0)
  static let SkyBlue: UIColor = UIColor(red: 118.0/255.0, green: 210.0/255.0, blue: 225.0/255.0, alpha: 1.0)
  static let GroundGreen: UIColor = UIColor(red: 95.0/255.0, green: 162.0/255.0, blue: 129.0/255.0, alpha: 1.0)
  static let GroundBorderGreen: UIColor = UIColor(red: 167.0/255.0, green: 214.0/255.0, blue: 146.0/255.0, alpha: 1.0)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.rootViewController = ViewController()
      self.window?.backgroundColor = Colors.BaseOrange

    let maskLayer: CALayer = CALayer()
//    maskLayer.backgroundColor = Colors.BaseOrange.CGColor
    maskLayer.contents = UIImage(named: "monkey_face")?.CGImage
    maskLayer.contentsGravity = kCAGravityResizeAspect
    maskLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 234.0, height: 182.0)
    maskLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    maskLayer.position = (self.window?.center)!
//    self.window?.maskView?.layer.addSublayer(maskLayer)
//    animateMask(maskLayer)
    self.window?.layer.mask = maskLayer
    
    
    self.window?.makeKeyAndVisible()
    UIApplication.sharedApplication().statusBarHidden = true
    return true
  }
  
  func animateMask(mask: CALayer) {
    
    let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
    keyFrameAnimation.delegate = self
    keyFrameAnimation.duration = 0.6
    keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
    keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
    let initalBounds = NSValue(CGRect: mask.bounds)
    let secondBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 90, height: 73))
    let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
    keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
    keyFrameAnimation.keyTimes = [0, 0.3, 1]
    mask.addAnimation(keyFrameAnimation, forKey: "bounds")
    
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

