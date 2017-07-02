//
//  Collection1ViewController.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 7. 1..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit
import SnapKit

class Collection2ViewController: UIViewController {

  var didSetupConstraints = false

  let cellName = "collectionViewCell1"

  var collection1Title: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15)
    label.textColor = .black
    return label
  }()

  let collection1View: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    collectionView.isPagingEnabled = false

    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let size:CGSize = UIScreen.main.bounds.size
    layout.itemSize = CGSize(width: size.width/2 - 5, height: size.width/2 )
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical

    collectionView.setCollectionViewLayout(layout, animated: false)
    return collectionView
  }()




  let dummyList1: [TableView1Model] = [
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", desc: ""),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", desc: ""),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", desc: ""),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", desc: ""),
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", desc: ""),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", desc: ""),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", desc: ""),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", desc: ""),
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", desc: ""),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", desc: ""),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", desc: ""),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", desc: ""),
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", desc: ""),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", desc: ""),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", desc: ""),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", desc: ""),
  ]



  override func viewDidLoad() {
    super.viewDidLoad()

    self.initUI()

    self.initCollectionView()

    self.setData()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  func setData(){
    self.collection1Title.text = "가로 두개 이미지"
  }


  static func instance() -> Collection2ViewController {
    let vc = Collection2ViewController()
    return vc
  }
}


extension Collection2ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  public func initCollectionView() {
    self.collection1View.dataSource = self
    self.collection1View.delegate = self
    self.collection1View.register(CollectionView2Cell.self, forCellWithReuseIdentifier: self.cellName)


  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    var count:Int = 0
    if(collectionView == self.collection1View){
      count = self.dummyList1.count
    }


    return count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell:CollectionView2Cell?
    if(collectionView == self.collection1View){
      cell = (collectionView.dequeueReusableCell(withReuseIdentifier: self.cellName, for:indexPath) as? CollectionView2Cell)
      cell?.bind(model: self.dummyList1[indexPath.row])
    }

    return cell!
  }
}


//snapkit

extension Collection2ViewController {
  func initUI() {
    self.view.backgroundColor = .white
    self.collection1View.backgroundColor = .white

    self.view.addSubview(self.collection1Title)
    self.view.addSubview(self.collection1View)

    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    if (!didSetupConstraints) {
      collection1Title.snp.makeConstraints { make in
        make.top.equalTo(topLayoutGuide.snp.bottom).offset(10)
        make.left.equalTo(10)
        make.right.equalTo(-10)
        make.height.equalTo(19)
      }
      collection1View.snp.makeConstraints { make in
        make.top.equalTo(collection1Title.snp.bottom).offset(10)
        make.left.right.bottom.equalTo(0)
      }

      didSetupConstraints = true
    }

    super.updateViewConstraints()
  }
}