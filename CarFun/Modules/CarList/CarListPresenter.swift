//
//  CarListPresenter.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import RxSwift

final class CarListPresenter: NSObject {

  private let carService: CarServiceInterface
  private let viewModelMapper: CarListViewModelMapper
  var privateViewModel = CarListViewModel()

  init(carService: CarServiceInterface, viewModelMapper: CarListViewModelMapper) {
    self.carService = carService
    self.viewModelMapper = viewModelMapper
  }

}

// MARK: - CarListPresenterInterface

extension CarListPresenter: CarListPresenterInterface {

  var viewModel: CarListViewModel {
    return privateViewModel
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

// MARK: - UITableViewDataSource

extension CarListPresenter: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.viewCars.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier, for: indexPath)
    if let cell = cell as? CarTableViewCell {
      cell.setup(viewModel: viewModel.viewCars[indexPath.row])
    }

    return cell
  }

}
