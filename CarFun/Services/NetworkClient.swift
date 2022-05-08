//
//  NetworkClient.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkClient {
  
  private let baseUrl = "REPLACE_WITH_YOUR_URL"
  private let alamofireManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForResource = 15 // seconds
    return Alamofire.SessionManager(configuration: configuration)
  }()
  
}

// MARK: - NetworkClientInterface

extension NetworkClient: NetworkClientInterface {
  
  // page is ignored for now
  func getCarList(page: Int, success: @escaping ([Car])->(), error: @escaping ()->()) {
    apiCall(
      .get,
      path: "cars",
      parameters: [:],
      onGetResponse: {
        obj in
        guard let data = obj as? Data,
              let result = try? JSONDecoder().decode([Car].self, from: data)
        else {
          error()
          return;
        }
        success(result)
      },
      onError: {
        errorObj in
        error()
      }
    )
  }
  
}

// MARK: - Private

private extension NetworkClient {
  
  private func apiCall(_ method: HTTPMethod, path: String, parameters: [String: Any], onGetResponse: @escaping (Any?)->(), onError: ((NSError?)->())?) {
    let encoding: ParameterEncoding = (method == .get) ? URLEncoding.default : JSONEncoding.default
    alamofireManager
      .request(self.getUrl(path: path), method: method, parameters: parameters, encoding: encoding)
      .responseJSON(
        completionHandler: {
          response in
          let statusCode = response.response?.statusCode ?? 404
          guard 200 <= statusCode &&
                  statusCode < 300
          else
          {
            onError?(response.result.error as NSError?)
            return
          }
          onGetResponse(response.result.value)
        }
      )
  }
  
  private func getUrl(path: String) -> String {
    return self.baseUrl + path
  }
  
}

