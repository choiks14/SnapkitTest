//
//  TableView2Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 25..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit

class TableView3Controller: UIViewController {

  var didSetupConstraints = false

  let cellName = "tableview3cell"

  let tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()

  let dummyList: [TableView3Model] = [
    TableView3Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/50/"),
    TableView3Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/51/50/"),
    TableView3Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/52/"),
    TableView3Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/52/50/"),
  ]


  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()

    self.initTableView()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  static func instance() -> TableView3Controller {
    let vc = TableView3Controller ()
    return vc
  }
}


extension TableView3Controller: UITableViewDelegate, UITableViewDataSource {
  public func initTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.separatorStyle = .none
    self.tableView.estimatedRowHeight = 212.0
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.register(TableView3Cell.self, forCellReuseIdentifier: self.cellName)
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dummyList.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
    let cell: TableView3Cell = tableView.dequeueReusableCell(withIdentifier: self
      .cellName) as! TableView3Cell
    cell.bind(model: self.dummyList[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}


//snapkit

extension TableView3Controller {
  func initUI() {
    self.view.addSubview(self.tableView)
    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {
      tableView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      didSetupConstraints = true
    }

    super.updateViewConstraints()
  }
}