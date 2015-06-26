//  PersonCell.swift
//  FinalProjectVer1
//
//  Created by Richard H Woolley on 6/22/15.
//  Copyright (c) 2015 Bright Quasar Software, R.Woolley.

import UIKit

public class PersonCell: UITableViewCell {  // deque of cell is cast to this type in ViewController.swift
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet var personImageView: UIImageView!

    override public func awakeFromNib() {  // I am in the dark here, this could be the problem ???????????????????????
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {  // not fully aware of this func, probably ok???
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
