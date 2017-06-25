//
//  TableView2Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 25..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit

class TableView2Controller: UIViewController {

  var didSetupConstraints = false

  let cellName = "tableview2cell"

  let tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()

  let dummyList: [TableView2Model] = [
    TableView2Model(name: "test1test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/101/"),
    TableView2Model(name: "test2test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/102/"),
    TableView2Model(name: "test3test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/103/"),
    TableView2Model(name: "test4test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/104/"),
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

  static func instance() -> TableView2Controller {
    let vc = TableView2Controller()
    return vc
  }

}


extension TableView2Controller: UITableViewDelegate, UITableViewDataSource {
  public func initTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.rowHeight = 80.0
    self.tableView.register(TableView2Cell.self, forCellReuseIdentifier: self.cellName)
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
      -> Int {

    return self.dummyList.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
    let cell: TableView2Cell = tableView.dequeueReusableCell(withIdentifier: self
      .cellName) as! TableView2Cell
    cell.bind(model: self.dummyList[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}


//snapkit

extension TableView2Controller {
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