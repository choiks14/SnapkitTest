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

class TableView3Cell: UITableViewCell {
  var userView: UIView = {
    let view = UIView()
    return view
  }()

  var seperateView:UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.gray
    return view
  }()


  let imageUrl: UIImageView = {
    let imgView = UIImageView()
    imgView.layer.borderColor = UIColor.gray.cgColor
    imgView.layer.borderWidth = 0.0
    return imgView
  }()


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
  var date: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .black
    label.numberOfLines = 1
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

  func bind(model: TableView3Model) {
    self.userName.text = model.name
    self.date.text = model.date
    self.userImage.kf.setImage(with:URL(string: model.userImageUrl!))
    self.imageUrl.kf.setImage(with:URL(string: model.imageUrl!))

  }
}

extension TableView3Cell {
  func setupUI() {

    self.contentView.backgroundColor = UIColor.gray

    self.addSubview(self.seperateView)
    self.addSubview(self.imageUrl)
    self.addSubview(self.userView)

    self.userView.backgroundColor = UIColor.white
    self.userView.addSubview(self.userName)
    self.userView.addSubview(self.userImage)
    self.userView.addSubview(self.date)

    //imageurl
    imageUrl.snp.makeConstraints({ (make) in
      make.top.equalTo(0)
      make.left.right.equalTo(0)
      make.height.equalTo(150)
      make.bottom.equalTo(userView.snp.top)
    })

    //userview
    userView.snp.makeConstraints({ (make) in
      make.top.equalTo(imageUrl.snp.bottom)
      make.left.right.equalTo(0)
      make.bottom.equalTo(seperateView.snp.top)
      make.height.equalTo(52)
    })

    //seperateView
    seperateView.snp.makeConstraints({ (make) in
      make.top.equalTo(userView.snp.bottom)
      make.left.right.equalTo(0)
      make.bottom.equalTo(0)
      make.height.equalTo(10)
    })

    //userimage
    userImage.snp.makeConstraints({ (make) in
      make.top.left.equalTo(6)
      make.width.height.equalTo(40)
    })

    //username
    userName.snp.makeConstraints { (make) in
      make.top.equalTo(5)
      make.left.equalTo(userImage.snp.right).offset(10)
      make.right.equalTo(-10)
      make.height.equalTo(19)
    }

    //date
    date.snp.makeConstraints { (make) in
      make.top.equalTo(userName.snp.bottom).offset(5)
      make.left.equalTo(userImage.snp.right).offset(10)
      make.right.equalTo(-10)
      make.bottom.equalTo(-5)
      make.height.equalTo(18)
    }
  }
}
