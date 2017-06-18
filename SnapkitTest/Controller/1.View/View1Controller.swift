//
//  View1Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 18..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation
import UIKit


class View1Controller: UIViewController {
    var didSetupConstraints = false

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    static func instance()->View1Controller{
        let vc = View1Controller()
        return vc
    }
}


//snapkit
extension View1Controller {

    func initUI() {
        self.view.backgroundColor = .white

        self.view.addSubview(self.redView)
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            //tableView
            redView.snp.makeConstraints { make in
                make.size.equalTo(100)
                make.center.equalToSuperview()
            }

            didSetupConstraints = true
        }

        super.updateViewConstraints()

    }
}

