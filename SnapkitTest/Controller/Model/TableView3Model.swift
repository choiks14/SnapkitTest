//
// Created by kangsik choi on 2017. 6. 25..
// Copyright (c) 2017 choiks14. All rights reserved.
//

import Foundation

struct TableView3Model{
  var name:String?
  var imageUrl:String?;
  var date:String?;
  var userImageUrl:String?;

  init(name:String,imageUrl:String,date:String,userImageUrl:String) {
    self.name = name
    self.imageUrl = imageUrl
    self.date = date
    self.userImageUrl = userImageUrl
  }
}