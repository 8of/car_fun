//
//  CarMapViewModel.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import RxSwift

final class CarMapViewModel {

  var viewCars = [CarMapItemViewModel]()
  var cars = BehaviorSubject<[CarMapItemViewModel]>(value: [])

}
