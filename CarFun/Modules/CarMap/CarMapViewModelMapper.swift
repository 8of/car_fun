//
//  CarMapViewModelMapper.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import MapKit

final class CarMapViewModelMapper {

  func map(cars: [Car]) -> [CarMapItemViewModel] {
    return cars.map({ map(car: $0) })
  }

  func map(car: Car) -> CarMapItemViewModel {
    let latitude = CLLocationDegrees(car.latitude)
    let longitude = CLLocationDegrees(car.longitude)
    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    return CarMapItemViewModel(coordinate: coordinate)
  }

}
