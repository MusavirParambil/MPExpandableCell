//
//  ViewController.swift
//  MPExpandableTableView
//
//  Created by Musavir on 14/12/19.
//  Copyright © 2019 thoughtMakerz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var dataSource = [MenuItems]()
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        loadJSONBundle()    }
    private func loadJSONBundle(){
        if let path = Bundle.main.path(forResource: "AllMenu", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if  let allMenu = try? JSONDecoder().decode([MenuItems].self, from: data){
                    self.dataSource.append(contentsOf: allMenu)
                }else{
                    print("parsing failed")
                }
            } catch {
            }
        }
    }
    func configureView(){
            self.view.addSubview(self.tableView)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            tableView.register(CategoryTableViewCell.nib(), forHeaderFooterViewReuseIdentifier: CategoryTableViewCell.nameOfClass)
            tableView.register(SubCategoryTableViewCell.nib(), forCellReuseIdentifier: SubCategoryTableViewCell.nameOfClass)
            tableView.separatorColor = .white
            tableView.separatorStyle = .none
        }
    func expandTableView(_ position:Int){
            if dataSource[position].open{
                dataSource[position].open = false
            }else{
                dataSource[position].open = true
            }
                self.tableView.reloadSections(NSIndexSet(index:position) as IndexSet, with: UITableView.RowAnimation.automatic)
    }
}
    extension ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 68
        }
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryTableViewCell.nameOfClass) as! CategoryTableViewCell
            headerView.headerView.tag = section
            headerView.config(dataSource[section])
            headerView.onclickHandler = {[weak self] (position) in
                self?.expandTableView(position)
            }
            return headerView
        }
    }
    extension ViewController:UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if dataSource[section].open {
                return dataSource[section].subCategory.count
            }else{
                 return 0
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: SubCategoryTableViewCell.nameOfClass, for: indexPath) as! SubCategoryTableViewCell
            cell.config(dataSource[indexPath.section].subCategory[indexPath.row])
            return cell
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return dataSource.count
        }
}

