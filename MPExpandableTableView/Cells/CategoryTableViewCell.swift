//
//  CategoryTableViewCell.swift
//  MakeMyApp
//
//  Created by Musavir on 22/06/19.
//  Copyright © 2019 Musavir. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet var headerView: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    var onclickHandler:((_ position:Int)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onclickListner)))
    }
    @objc
    func onclickListner(){
        self.onclickHandler?(headerView.tag)
    }
    class func  nib()->UINib{
        return UINib(nibName: CategoryTableViewCell.nameOfClass, bundle: nil)
    }
    func config(_ model:MenuItems){
        self.lblTitle.text = model.name
    }
}
