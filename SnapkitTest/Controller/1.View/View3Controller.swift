//
//  View2Controller.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 18..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation
import Foundation
import UIKit


class View3Controller: UIViewController {
    var didSetupConstraints = false

    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

    let bodyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    static func instance()->View3Controller{
        let vc = View3Controller()
        return vc
    }
}

//snapkit
extension View3Controller {

    func initUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.footerView)
        self.view.addSubview(self.bodyView)
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            /*
                body
                footer
            */
            bodyView.snp.makeConstraints { (make) in
                make.top.equalTo(self.view)
                make.top.left.right.equalTo(self.view)
                make.bottom.equalTo(self.footerView.snp.top)
            }

            footerView.snp.makeConstraints { (make) in
                make.height.equalTo(100)
                make.top.equalTo(self.bodyView.snp.bottom)
                make.bottom.left.right.equalTo(self.view)
            }

            didSetupConstraints = true
        }

        super.updateViewConstraints()

    }
}