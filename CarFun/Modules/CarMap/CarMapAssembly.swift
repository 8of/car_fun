//
//  CarMapAssembly.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIViewController

final class CarMapAssembly {

  let view: CarMapViewController
  let carServicesAssembly = ServicesAssembly()

  init() {
    let presenter = CarMapPresenter(carService: carServicesAssembly.carService, viewModelMapper: CarMapViewModelMapper())
    view = CarMapViewController.init(presenter: presenter)
  }

}
