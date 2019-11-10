//
//  CarTableViewCell.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import AlamofireImage

final class CarTableViewCell: UITableViewCell {

  private let photoImageView: UIImageView = {
    let view = UIImageView(image: UIImage(named: "waiting"))
    return view
  }()
  private let carTextLabel = UILabel()

  class var reuseIdentifier: String {
    return "CarTableViewCell"
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    initialSetup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialSetup()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    photoImageView.image = UIImage(named: "waiting")
  }

  func setup(viewModel: CarListItemViewModel) {
    carTextLabel.text = "\(viewModel.name)\n\(viewModel.model)\n\(viewModel.licensePlate)\n\(viewModel.innerCleanliness)\n\(viewModel.fuelLevel)"
    if let url = URL(string: viewModel.imageURL) {
      photoImageView.af_setImage(withURL: url)
    } else {
      photoImageView.image = UIImage(named: "error")
    }
  }

}

// MARK: - Private

private extension CarTableViewCell {

  func initialSetup() {
    carTextLabel.numberOfLines = 0
    photoImageView.autoSetDimension(.height, toSize: 200)
    let stackView = UIStackView(arrangedSubviews: [photoImageView, carTextLabel])
    stackView.axis = .vertical
    addSubview(stackView)
    stackView.autoPinEdgesToSuperviewMargins()
  }

}
