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


class View2Controller: UIViewController {
    var didSetupConstraints = false

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    static func instance() -> View2Controller {
        let vc = View2Controller()
        return vc
    }
}

//snapkit
extension View2Controller {
    func initUI() {
        self.view.backgroundColor = .white

        self.view.addSubview(self.redView)
        self.view.addSubview(self.greenView)
        self.view.addSubview(self.blackView)
        self.view.addSubview(self.blueView)

        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            /*
                green   | blue
                red     | black
            */
            redView.snp.makeConstraints { (make) in
                let multipler = 1.0 / 2.0
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.top.equalTo(self.view)
                make.left.equalTo(self.view)
            }

            blueView.snp.makeConstraints { (make) in
                let multipler = 1.0 / 2.0
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.top.equalTo(self.view)
                make.right.equalTo(self.view)
            }

            greenView.snp.makeConstraints { (make) in
                let multipler = 1.0 / 2.0
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.bottom.equalTo(self.view)
                make.right.equalTo(self.view)
            }

            blackView.snp.makeConstraints { (make) in
                let multipler = 1.0 / 2.0
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.bottom.equalTo(self.view)
                make.left.equalTo(self.view)
            }

            didSetupConstraints = true
        }

        super.updateViewConstraints()

    }
}
