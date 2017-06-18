//
//  View1Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 18..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation
import UIKit


class View5Controller: UIViewController {
  var didSetupConstraints = false

  let redView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.red
    return view
  }()


  let contentView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
  }()


  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  static func instance() -> View5Controller {
    let vc = View5Controller()
    return vc
  }
}

//snapkit

extension View5Controller {

  func initUI() {
    self.view.backgroundColor = .white
    self.view.addSubview(self.contentView)
    self.contentView.addSubview(self.redView)

    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {

      self.contentView.snp.makeConstraints { make in
        make.top.equalTo(self.topLayoutGuide.snp.bottom)
        make.bottom.left.right.equalToSuperview()
      }

      self.redView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }

      didSetupConstraints = true
    }

    super.updateViewConstraints()

  }
}
