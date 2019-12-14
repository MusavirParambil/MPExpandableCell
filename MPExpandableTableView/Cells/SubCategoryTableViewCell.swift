//
//  SubCategoryTableViewCell.swift
//  MakeMyApp
//
//  Created by Musavir on 22/06/19.
//  Copyright © 2019 Musavir. All rights reserved.
//

import UIKit

class SubCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDisplayname: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class func  nib()->UINib{
        return UINib(nibName: SubCategoryTableViewCell.nameOfClass, bundle: nil)
    }
    func config(_ subCategory:SubCategory){
        self.lblName.text = subCategory.name
        self.lblDisplayname.text = subCategory.displayName

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
