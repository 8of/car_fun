//
//  CarListPresenterInterface.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol CarListPresenterInterface: UITableViewDataSource {

  var viewModel: CarListViewModel { get }
  func loadCars()

}
