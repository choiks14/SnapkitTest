//
//  Collection1ViewController.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 7. 1..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit
import SnapKit

class Collection3ViewController: UIViewController {

  var didSetupConstraints = false

  let cellName = "collectionViewCell1"

  var collectionTitle: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15)
    label.textColor = .black
    return label
  }()

  let collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    collectionView.isPagingEnabled = false
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let size:CGSize = UIScreen.main.bounds.size
    layout.itemSize = CGSize(width: size.width/2 - 15, height: size.width/2 )
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 5
    layout.scrollDirection = .vertical

    collectionView.setCollectionViewLayout(layout, animated: false)
    return collectionView
  }()




  let dummyList: [TableView3Model] = [
    TableView3Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/50/"),
    TableView3Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/51/50/"),
    TableView3Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/52/"),
    TableView3Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/52/50/"),
    TableView3Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/50/"),
    TableView3Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/51/50/"),
    TableView3Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/52/"),
    TableView3Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/52/50/"),
    TableView3Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/50/"),
    TableView3Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/51/50/"),
    TableView3Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/50/52/"),
    TableView3Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", date: "2017-01-12 12:12:11", userImageUrl: "https://lorempixel.com/52/50/"),
  ]



  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()

    self.initCollectionView()

    self.setData()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


  func setData(){
    self.collectionTitle.text = "카드 레이아웃"
  }


  static func instance() -> Collection3ViewController {
    let vc = Collection3ViewController()
    return vc
  }
}


extension Collection3ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  public func initCollectionView() {
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.register(CollectionView3Cell.self, forCellWithReuseIdentifier:
    self.cellName)


  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    var count:Int = 0
    if(collectionView == self.collectionView){
      count = self.dummyList.count
    }


    return count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell:CollectionView3Cell?
    if(collectionView == self.collectionView){
      cell = (collectionView.dequeueReusableCell(withReuseIdentifier: self.cellName, for:indexPath) as? CollectionView3Cell)
      cell?.bind(model: self.dummyList[indexPath.row])
    }

    return cell!
  }
}


//snapkit

extension Collection3ViewController {
  func initUI() {
    self.view.backgroundColor = .white
    self.collectionView.backgroundColor = .white

    self.view.addSubview(self.collectionTitle)
    self.view.addSubview(self.collectionView)

    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {
      collectionTitle.snp.makeConstraints { make in
        make.top.equalTo(topLayoutGuide.snp.bottom).offset(10)
        make.left.equalTo(10)
        make.right.equalTo(-10)
        make.height.equalTo(19)
      }
      collectionView.snp.makeConstraints { make in
        make.top.equalTo(collectionTitle.snp.bottom).offset(10)
        make.left.right.bottom.equalTo(0)
      }

      didSetupConstraints = true
    }

    super.updateViewConstraints()
  }
}