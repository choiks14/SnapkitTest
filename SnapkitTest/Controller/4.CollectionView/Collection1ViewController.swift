//
//  Collection1ViewController.swift
//  SnapkitTest
//
//  Created by kangsik choi on 2017. 7. 1..
//  Copyright (c) 2017 choiks14. All rights reserved.
//

import UIKit

class Collection1ViewController: UIViewController {

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
    collectionView.isPagingEnabled = true

    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let size:CGSize = UIScreen.main.bounds.size
    layout.itemSize = CGSize(width: size.width, height: 200)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal

    collectionView.setCollectionViewLayout(layout, animated: false)
    return collectionView
  }()


  var collection2Title: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15)
    label.textColor = .black
    return label
  }()

  let collection2View: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    collectionView.isPagingEnabled = false

    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let size:CGSize = UIScreen.main.bounds.size
    layout.itemSize = CGSize(width: size.width, height: 200)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal

    collectionView.setCollectionViewLayout(layout, animated: false)
    return collectionView
  }()

  let dummyList1: [TableView1Model] = [
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/100/101/", desc: ""),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/100/102/", desc: ""),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/100/103/", desc: ""),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/100/104/", desc: ""),
  ]

  let dummyList2: [TableView1Model] = [
    TableView1Model(name: "test1", imageUrl: "https://lorempixel.com/101/101/", desc: ""),
    TableView1Model(name: "test2", imageUrl: "https://lorempixel.com/102/102/", desc: ""),
    TableView1Model(name: "test3", imageUrl: "https://lorempixel.com/103/103/", desc: ""),
    TableView1Model(name: "test4", imageUrl: "https://lorempixel.com/104/104/", desc: ""),
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
    self.collection1Title.text = "페이징 true"
    self.collection2Title.text = "페이징 false"
  }

  static func instance() -> Collection1ViewController {
    let vc = Collection1ViewController()
    return vc
  }
}

//collectionview
extension Collection1ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  public func initCollectionView() {
    self.collection1View.dataSource = self
    self.collection1View.delegate = self
    self.collection1View.register(CollectionView1Cell.self, forCellWithReuseIdentifier: self.cellName)

    self.collection2View.dataSource = self
    self.collection2View.delegate = self

    self.collection2View.register(CollectionView1Cell.self, forCellWithReuseIdentifier:
    self.cellName)
  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    var count:Int = 0
    if(collectionView == self.collection1View){
      count = self.dummyList1.count
    }
    else if(collectionView == self.collection2View){
      count = self.dummyList2.count
    }

    return count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell:CollectionView1Cell?
    if(collectionView == self.collection1View){
      cell = (collectionView.dequeueReusableCell(withReuseIdentifier: self.cellName, for:indexPath) as? CollectionView1Cell)
      cell?.bind(model: self.dummyList1[indexPath.row])
    }
    else if(collectionView == self.collection2View){
      cell = (collectionView.dequeueReusableCell(withReuseIdentifier: self.cellName, for:indexPath) as? CollectionView1Cell)
      cell?.bind(model: self.dummyList2[indexPath.row])
    }
    return cell!
  }
}


//snapkit
extension Collection1ViewController {
  func initUI() {
    self.view.backgroundColor = .white
    self.collection1View.backgroundColor = .white
    self.collection2View.backgroundColor = .white


    self.view.addSubview(self.collection1Title)
    self.view.addSubview(self.collection1View)
    self.view.addSubview(self.collection2Title)
    self.view.addSubview(self.collection2View)

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
        make.top.equalTo(collection1Title.snp.bottom)
        make.left.right.equalTo(0)
        make.height.equalTo(200)
      }

      collection2Title.snp.makeConstraints { make in
        make.top.equalTo(collection1View.snp.bottom).offset(10)
        make.left.equalTo(10)
        make.right.equalTo(-10)
        make.height.equalTo(19)
      }

      collection2View.snp.makeConstraints { make in
        make.top.equalTo(collection2Title.snp.bottom)
        make.left.right.equalTo(0)
        make.height.equalTo(200)
      }

      didSetupConstraints = true
    }

    super.updateViewConstraints()
  }
}