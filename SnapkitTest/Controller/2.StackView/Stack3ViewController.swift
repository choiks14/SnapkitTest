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


class Stack3ViewController: UIViewController {
  var didSetupConstraints = false

  let stackView:UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 10
    stack.translatesAutoresizingMaskIntoConstraints = false;
    stack.backgroundColor = .white
    stack.alignment = .fill
    stack.distribution = .fillEqually
    return stack
  } ()

  let view1:UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

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

  let view2:UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

  let stackView2:UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 10
    stack.translatesAutoresizingMaskIntoConstraints = false;
    stack.backgroundColor = .white
    stack.alignment = .fill
    stack.distribution = .equalSpacing
    return stack
  } ()


  let redView1:UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()

  let blueView1:UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()

  let greenView2:UIView = {
    let view = UIView()
    view.backgroundColor = .green
    return view
  }()

  let yellowView2:UIView = {
    let view = UIView()
    view.backgroundColor = .yellow
    return view
  }()

  let blackView2:UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()


  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  static func instance() -> Stack3ViewController {
    let vc = Stack3ViewController()
    return vc
  }
}


//snapkit
extension Stack3ViewController {
  func initUI() {
    self.view.backgroundColor = .white

    self.view.addSubview(stackView)

    self.stackView.addArrangedSubview(view1)
    self.stackView.addArrangedSubview(view2)

    self.view1.addSubview(stackView1)
    self.stackView1.addArrangedSubview(blueView1)
    self.stackView1.addArrangedSubview(redView1)

    self.view2.addSubview(stackView2)
    self.stackView2.addArrangedSubview(blackView2)
    self.stackView2.addArrangedSubview(greenView2)
    self.stackView2.addArrangedSubview(yellowView2)

    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {

      //wrapper
      stackView.snp.makeConstraints { make in
        make.top.equalTo(topLayoutGuide.snp.bottom)
        make.bottom.left.right.equalTo(0)
      }

      //stackview1
      stackView1.snp.makeConstraints { make in
        make.top.bottom.left.right.equalTo(0)
      }

      //stackview2
      stackView2.snp.makeConstraints { make in
        make.top.bottom.left.right.equalTo(0)
      }

      blackView2.snp.makeConstraints { make in
        make.width.equalTo(self.view).multipliedBy(0.30)
      }

      greenView2.snp.makeConstraints { make in
        make.width.equalTo(self.view).multipliedBy(0.30)
      }

      yellowView2.snp.makeConstraints { make in
        make.width.equalTo(self.view).multipliedBy(0.30)
      }

      didSetupConstraints = true
    }

    super.updateViewConstraints()

  }
}

