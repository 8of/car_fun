//
//  CarMapItemViewModel.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import MapKit

final class CarMapItemViewModel: NSObject, MKAnnotation {

  let coordinate: CLLocationCoordinate2D

  init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
  }

}
