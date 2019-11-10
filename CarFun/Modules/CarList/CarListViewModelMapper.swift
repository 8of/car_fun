//
//  CarListViewModelMapper.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

final class CarListViewModelMapper {

  func map(cars: [Car]) -> [CarListItemViewModel] {
    return cars.map({ map(car: $0) })
  }

  func map(car: Car) -> CarListItemViewModel {

    let cleanliness = NSLocalizedString("innerCleanliness.\(car.innerCleanliness)", comment: "")
    return CarListItemViewModel(
      model: car.modelName,
      name: car.name,
      licensePlate: car.licensePlate,
      fuelLevel: "Fuel level: \(car.fuelLevel)",
      innerCleanliness: cleanliness,
      imageURL: car.imageUrl
    )
  }

}
