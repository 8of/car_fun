//
//  Parser.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

struct Parser {

  func parseCars(dictionary: [[String: Any]]) -> [Car] {
    return dictionary.map({ parseCar(dictionary: $0) }).compactMap({ $0 })
  }

  // MARK: - Private

  private func parseCar(dictionary: [String: Any]) -> Car? {
    guard let id = dictionary["id"] as? String,
      let modelIdentifier = dictionary["modelIdentifier"] as? String,
      let modelName = dictionary["modelName"] as? String,
      let name = dictionary["name"] as? String,
      let make = dictionary["make"] as? String,
      let group = dictionary["group"] as? String,
      let color = dictionary["color"] as? String,
      let series = dictionary["series"] as? String,
      let fuelTypeRaw = dictionary["fuelType"] as? String,
      let fuelType = FuelType(rawValue: fuelTypeRaw),
      let fuelLevel = (dictionary["fuelLevel"] as? NSNumber)?.floatValue,
      let transmissionRaw = dictionary["transmission"] as? String,
      let transmission = TransmissionType(rawValue: transmissionRaw),
      let licensePlate = dictionary["licensePlate"] as? String,
      let latitude = (dictionary["latitude"] as? NSNumber)?.floatValue,
      let longitude = (dictionary["longitude"] as? NSNumber)?.floatValue,
      let innerCleanliness = dictionary["innerCleanliness"] as? String,
      let carImageUrl = dictionary["carImageUrl"] as? String
      else {
        return nil
    }
    return Car(id: id,
               modelIdentifier: modelIdentifier,
               modelName: modelName,
               name: name,
               make: make,
               group: group,
               color: color,
               series: series,
               fuelType: fuelType,
               fuelLevel: fuelLevel,
               transmission: transmission,
               licensePlate: licensePlate,
               latitude: latitude,
               longitude: longitude,
               innerCleanliness: innerCleanliness,
               imageUrl: carImageUrl
    )
  }

}
