//
//  ServicesAssembly.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

final class ServicesAssembly {

  var carService: CarServiceInterface {
    return CarService(networkClient: networkClient)
  }

  private let networkClient: NetworkClientInterface = LocalClient() // or NetworkClient()

}
