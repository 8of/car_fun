//
//  CarListViewController.swift
//  CarFun
//
//  Created by Andrei Konstantinov on 18/06/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift

final class CarListViewController: UIViewController {

  private let presenter: CarListPresenterInterface
  private let tableView = UITableView()
  private let disposeBag = DisposeBag()

  init(presenter: CarListPresenterInterface) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("We don't use Storyboards in this project")
  }

  override func loadView() {
    view = UIView()
    view.addSubview(tableView)
    tableView.allowsSelection = false
    tableView.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets.zero, excludingEdge: .top)
    tableView.autoPinEdge(toSuperviewEdge: .top)
    tableView.rowHeight = UITableView.automaticDimension
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
    tableView.dataSource = presenter

    presenter
      .viewModel
      .cars
      .map({ $0.count })
      .subscribe({
        [weak self]
        event in
        self?.tableView.reloadData()
      })
      .disposed(by: disposeBag)

    presenter.loadCars()
  }

}
