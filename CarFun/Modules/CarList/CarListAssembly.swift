//
//  CarListAssembly.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIViewController

final class CarListAssembly {

  let view: CarListViewController
  let carServicesAssembly = ServicesAssembly()

  init() {
    let presenter: CarListPresenterInterface = CarListPresenter(carService: carServicesAssembly.carService, viewModelMapper: CarListViewModelMapper())
    view = CarListViewController.init(presenter: presenter)
  }

}
