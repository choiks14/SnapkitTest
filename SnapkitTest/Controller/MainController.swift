//
//  MainController.swift
//  Snapkit
//
//  Created by kangsik choi on 2017. 6. 18..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit
import SnapKit

class MainController: UIViewController {
  let cellName = "cell"
  var didSetupConstraints = false

  let menuList: [String] = ["1.View 가운데",
    "2.View 4등분",
    "3.Body,Footer 나누기",
    "4-1.TopLayoutGuide 없이",
    "4-2.TopLayoutGuide 추가",
    "1.StackView(세로)",
    "2.StackView(가로)",
    "3.StackView(복합)",
    "1.기본 tableview",
    "2.동적 높이 tableview",
    "3.이미지 tableview",
    "1.이미지(가로) collection",
    "2.이미지(세로) collection",
    "3.카드(세로) collection"]




  let tableView: UITableView = {
    let tableView = UITableView()

    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()

    self.initTableView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
  func goViewController(vc: UIViewController) {
    self.navigationController?.pushViewController(vc, animated: true)
  }

  public func initTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.rowHeight = 44
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellName)
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
      -> Int {

    return self.menuList.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellName)!
    cell.textLabel?.text = self.menuList[indexPath.row]

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    var vc: UIViewController?
    if (indexPath.row == 0) {
      vc = View1Controller.instance()
    } else if (indexPath.row == 1) {
      vc = View2Controller.instance()
    } else if (indexPath.row == 2) {
      vc = View3Controller.instance()
    } else if (indexPath.row == 3) {
      vc = View4Controller.instance()
    } else if (indexPath.row == 4) {
      vc = View5Controller.instance()
    } else if (indexPath.row == 5) {
      vc = Stack1ViewController.instance()
    }else if (indexPath.row == 6) {
      vc = Stack2ViewController.instance()
    }else if (indexPath.row == 7) {
      vc = Stack3ViewController.instance()
    }else if (indexPath.row == 8) {
      vc = TableView2Controller.instance()
    }else if (indexPath.row == 9) {
      vc = TableView1Controller.instance()
    }else if (indexPath.row == 10) {
      vc = TableView3Controller.instance()
    }else if (indexPath.row == 11) {
      vc = Collection1ViewController.instance()
    } else if (indexPath.row == 12) {
      vc = Collection2ViewController.instance()
    }else if (indexPath.row == 13) {
      vc = Collection3ViewController.instance()
    }
    if let _vc = vc {
      _vc.title = self.menuList[indexPath.row]
      self.goViewController(vc: _vc)
    }
  }
}

//snapkit
extension MainController {
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
