//
//  NetworkClientInterface.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol NetworkClientInterface: AnyObject {

  func getCarList(page: Int, success: @escaping ([Car])->(), error: @escaping ()->())

}
