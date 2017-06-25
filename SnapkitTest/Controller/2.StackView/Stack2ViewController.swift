//
//  View1Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 18..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class Stack2ViewController: UIViewController {
  var didSetupConstraints = false

  let stackView1:UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 10
    stack.translatesAutoresizingMaskIntoConstraints = false;
    stack.backgroundColor = .white
    stack.alignment = .fill
    stack.distribution = .fillEqually
    return stack
  } ()

  let view1:UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()

  let view2:UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()


  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  static func instance() -> Stack2ViewController {
    let vc = Stack2ViewController()
    return vc
  }
}


//snapkit
extension Stack2ViewController {
  func initUI() {
    self.view.backgroundColor = .white

    self.view.addSubview(stackView1)
    self.stackView1.addArrangedSubview(view1)
    self.stackView1.addArrangedSubview(view2)

    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {
      stackView1.snp.makeConstraints { make in
        make.top.equalTo(topLayoutGuide.snp.bottom)
        make.bottom.left.right.equalTo(0)
      }

      didSetupConstraints = true
    }

    super.updateViewConstraints()

  }
}

