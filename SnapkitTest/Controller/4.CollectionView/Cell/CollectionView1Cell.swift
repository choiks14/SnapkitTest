//
//  CollectionView1Cell.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 7. 1..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit

class CollectionView1Cell: UICollectionViewCell {
  let userImage: UIImageView = {
    let imgView = UIImageView()
    imgView.layer.borderColor = UIColor.gray.cgColor
    imgView.layer.borderWidth = 0.0
    return imgView
  }()



  override init(frame: CGRect) {
    super.init(frame: frame)

    setupUI()
  }


  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }


  func bind(model: TableView1Model) {
    self.userImage.kf.setImage(with:URL(string: model.imageUrl!))
  }
}



extension CollectionView1Cell {
  func setupUI() {
    self.contentView.backgroundColor = .white
    self.addSubview(self.userImage)

    userImage.snp.makeConstraints({ (make) in
      make.top.left.equalTo(10)
      make.bottom.right.equalTo(-10)
    })
  }
}
