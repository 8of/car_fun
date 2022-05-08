//
//  LocalClient.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 10/11/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

final class LocalClient {
  
}

// MARK: - NetworkClientInterface

extension LocalClient: NetworkClientInterface {
  func getCarList(page: Int, success: @escaping ([Car]) -> (), error onError: @escaping () -> ()) {
    let path: String! = Bundle.main.path(forResource: "cars", ofType: "json")
    let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    
    do {
      let result = try JSONDecoder().decode([Car].self, from: data)
      success(result)
    } catch {
      onError()
    }
  }
  
}

