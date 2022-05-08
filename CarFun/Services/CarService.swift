//
//  CarService.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

final class CarService {
  
  private let networkClient: NetworkClientInterface!
  
  init(networkClient: NetworkClientInterface) {
    self.networkClient = networkClient
  }
  
  private init() {
    networkClient = nil
  }
  
}

// MARK: - CarServiceInterface

extension CarService: CarServiceInterface {
  
  func getCarList(page: Int, success: @escaping ([Car])->(), error: @escaping ()->()) {
    networkClient.getCarList(
      page: page,
      success: { cars in
        success(cars)
      }, error: error
    )
  }
  
}


