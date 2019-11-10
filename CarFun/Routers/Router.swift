//
//  Router.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIViewController

final class Router {

  func setupRootViewController(on viewController: UIViewController?) {
    guard let tabBarController = viewController as? UITabBarController else {
      assert(viewController is UITabBarController, "Should be UITabBarController")
      return;
    }

    let carMapAssembly = CarMapAssembly()
    // In real app we should use our own custom images
    // with UITabBarItem(title: , image: , tag: )
    carMapAssembly.view.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

    let carListAssembly = CarListAssembly()
    carListAssembly.view.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

    tabBarController.viewControllers = [carMapAssembly.view, carListAssembly.view]
  }

}
