//
//  TransmissionType.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

enum TransmissionType: String {
  case M
  case A
}

// MARK: - Decodable

extension TransmissionType: Decodable {}
