//  Person.swift
//  FinalProjectVer1
//
//  Created by Richard H Woolley on 6/22/15.
//  Copyright (c) 2015 Bright Quasar Software, R.Woolley.
import UIKit

class Person: NSObject, NSCoding  {
  var firstName: String
  var lastName: String
  var image: UIImage!   // this should also be changed back to ?
                       // ... the ! probably has no impact here???? Can run without it. 

  init (first: String, last: String, image: UIImage) {
    self.firstName = first
    self.lastName = last
    self.image = image
  }

  required init(coder aDecoder: NSCoder) {  // per NSCoding protocol
    self.firstName = aDecoder.decodeObjectForKey("firstName") as!String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    self.image = aDecoder.decodeObjectForKey("image") as! UIImage // must eventualy change the ! to ? if/when image is made optional.
  }

  func encodeWithCoder(aCoder: NSCoder) {  // per NSCoding protocol
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    aCoder.encodeObject(self.image, forKey: "image")
  }

}
