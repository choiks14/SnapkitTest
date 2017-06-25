//
//  TableView1Cell.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 6. 25..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class TableView1Cell: UITableViewCell {
  let userImage: UIImageView = {
    let imgView = UIImageView()
    imgView.layer.borderColor = UIColor.gray.cgColor
    imgView.layer.borderWidth = 1.0
    return imgView
  }()
  var userName: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15)
    label.textColor = .red
    return label
  }()
  var userDesc: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .black
    label.numberOfLines = 0
    return label
  }()


  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  func bind(model: TableView1Model) {
    self.userName.text = model.name
    self.userImage.kf.setImage(with:URL(string: model.imageUrl!))
    self.userDesc.text = model.desc
  }
}

extension TableView1Cell {
  func setupUI() {

    self.addSubview(self.userName)
    self.addSubview(self.userImage)
    self.addSubview(self.userDesc)


    //设置布局 SnapKit  --- >相当去Objective-C中的Masonry
    userImage.snp.makeConstraints({ (make) in
      make.top.left.equalTo(10)
      make.width.height.equalTo(40)
    })

    userName.snp.makeConstraints { (make) in
      make.top.equalTo(10)
      make.left.equalTo(userImage.snp.right).offset(10)
      make.right.equalTo(-10)
      make.height.equalTo(21)
    }

    userDesc.snp.makeConstraints { (make) in
      make.top.equalTo(userName.snp.bottom).offset(5)
      make.left.equalTo(userImage.snp.right).offset(10)
      make.right.equalTo(-10)
      make.bottom.equalTo(-10)
    }

  }
}
