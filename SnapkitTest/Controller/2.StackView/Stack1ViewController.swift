//
//  View1Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 18..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation
import UIKit


class Stack1Controller: UIViewController {
  var didSetupConstraints = false

  let stackView1:UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 10
    return stack
  } ()

  let view1 = UIView()
  let view2 = UIView()



  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  static func instance() -> Stack1Controller {
    let vc = Stack1Controller()
    return vc
  }
}


//snapkit
extension Stack1Controller {
  func initUI() {
    self.view.backgroundColor = .white

    self.view.addSubview(self.stackView1 )
    self.stackView1.backgroundColor = .black

    self.stackView1.addSubview(view1)
    self.view1.backgroundColor = .blue
    self.stackView1.addSubview(view2)
    self.view1.backgroundColor = .red

    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {
      //tableView
      stackView1.snp.makeConstraints { make in
        make.bottom.top.left.right.equalToSuperview()

      }

      view1.snp.makeConstraints { make in
        make.height.equalTo(100)
      }

      view2.snp.makeConstraints { make in
        make.height.equalTo(100)
      }



      didSetupConstraints = true
    }

    super.updateViewConstraints()

  }
}

