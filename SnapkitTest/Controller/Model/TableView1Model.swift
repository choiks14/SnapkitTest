//
// Created by kangsik choi on 2017. 6. 25..
// Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation

struct TableView1Model{
  var name:String?
  var imageUrl:String?;
  var desc:String?

  init(name:String,imageUrl:String,desc:String) {
    self.name = name
    self.imageUrl = imageUrl
    self.desc = desc
  }
}