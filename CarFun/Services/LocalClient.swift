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
    func getCarList(page: Int, success: @escaping ([Any]) -> (), error: @escaping () -> ()) {
        let path: String! = Bundle.main.path(forResource: "cars", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        guard let result = jsonResult as? [Any] else {
          error()
          return;
        }
        success(result)
    }

}
