//
//  CarMapPresenter.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

final class CarMapPresenter {

  private let carService: CarServiceInterface
  private let viewModelMapper: CarMapViewModelMapper
  var viewModel = CarMapViewModel()

  init(carService: CarServiceInterface, viewModelMapper: CarMapViewModelMapper) {
    self.carService = carService
    self.viewModelMapper = viewModelMapper
  }

  func loadCars() {
    carService.getCarList(
      page: 0,
      success: {
        [weak self]
        cars in
        guard let self = self else { return }
        let mappedCars = self.viewModelMapper.map(cars: cars)
        self.viewModel.viewCars = mappedCars
        self.viewModel.cars.onNext(mappedCars)
      }, error: {
        [weak self] in
        self?.viewModel.viewCars = []
    })
  }

}
