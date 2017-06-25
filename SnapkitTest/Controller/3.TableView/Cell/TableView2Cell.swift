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

class TableView2Cell: UITableViewCell {
  let userImage: UIImageView = {
    let imgView = UIImageView()
    return imgView
  }()
  var userName: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15)
    label.textColor = .red
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

  func bind(model: TableView2Model) {
    self.userName.text = model.name
    self.userImage.kf.setImage(with:URL(string: model.imageUrl!))
  }
}

extension TableView2Cell {
  func setupUI() {
    self.accessoryType = .disclosureIndicator

    self.addSubview(self.userImage)
    self.addSubview(self.userName)

    userImage.snp.makeConstraints({ (make) in
      make.left.equalTo(contentView.snp.left).offset(10)
      make.top.equalTo(10)
      make.bottom.equalTo(-10)
      make.width.equalTo(userImage.snp.height)
    })

    userName.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.left.equalTo(userImage.snp.right).offset(10)
      make.right.equalTo(contentView.snp.right)
      make.height.equalTo(21)
    }

  }
}
