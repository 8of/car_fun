//
//  CarMapViewController.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import RxSwift
import MapKit

final class CarMapViewController: UIViewController {

  private let presenter: CarMapPresenter
  private let mapView = MKMapView()
  private let disposeBag = DisposeBag()

  init(presenter: CarMapPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("We don't use Storyboards in this project")
  }

  override func loadView() {
    view = UIView()
    view.addSubview(mapView)
    mapView.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets.zero, excludingEdge: .top)
    mapView.autoPinEdge(toSuperviewEdge: .top)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    presenter
      .viewModel
      .cars
      .subscribe({
        [weak self]
        event in
        guard let self = self,
          let annotations = event.element
          else { return }
        self.mapView.showAnnotations(annotations, animated: true)
      })
      .disposed(by: disposeBag)

    presenter.loadCars()
  }

}
