//
//  TableView1Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 20..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit

class TableView1Controller: UIViewController {
  var didSetupConstraints = false

  let cellName = "tableview1cell"

  let tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()

  let dummyList: [TableView1Model] = [
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", desc:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", desc:
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", desc:
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", desc:
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."),
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

  static func instance() -> TableView1Controller {
    let vc = TableView1Controller()
    return vc
  }
}


extension TableView1Controller: UITableViewDelegate, UITableViewDataSource {
  public func initTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.estimatedRowHeight = 70.0
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.register(TableView1Cell.self, forCellReuseIdentifier: self.cellName)
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
      -> Int {

    return self.dummyList.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
    let cell: TableView1Cell = tableView.dequeueReusableCell(withIdentifier: self
      .cellName) as! TableView1Cell
    cell.bind(model:self.dummyList[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}


//snapkit

extension TableView1Controller {
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