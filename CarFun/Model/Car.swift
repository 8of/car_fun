//
//  Car.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

struct Car {
  // Maybe idx instead of id in case we'll move to ObjC (I hope not!)
  // Becuase 'id is reserved word in ObjC
  let id: String
  let modelIdentifier: String
  let modelName: String
  let name: String
  let make: String
  let group: String
  let color: String
  let series: String
  let fuelType: FuelType
  let fuelLevel: Float
  let transmission: TransmissionType
  let licensePlate: String
  let latitude: Float
  let longitude: Float
  let innerCleanliness: String
  let imageUrl: String
}

// MARK: - Codable

extension Car: Decodable {
  enum CodingKeys: String, CodingKey {
    case id
    case modelIdentifier
    case modelName
    case name
    case make
    case group
    case color
    case series
    case fuelType
    case fuelLevel
    case transmission
    case licensePlate
    case latitude
    case longitude
    case innerCleanliness
    case imageUrl = "carImageUrl"
  }
}

