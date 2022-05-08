//
//  FuelType.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

enum FuelType: String {
  case D
  case P
  case E
}

// MARK: - Decodable

extension FuelType: Decodable {}
