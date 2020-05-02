//
//  ArrayTableViewController.swift
//  GameOfThrones
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class ArrayTableViewController <Element> : UITableViewController {

    let dataSource : ArrayDataSource <Element>
    let arrayDelegate : BaseViewControllerDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>, delegate: BaseViewControllerDelegate<Element>? = nil, title: String, style: UITableView.Style) {

        self.dataSource = dataSource
        self.arrayDelegate = delegate
        super.init(style: style)
        self.tableView.dataSource = dataSource
        
        self.arrayDelegate?.viewController = self
        self.arrayDelegate?.source = dataSource

        self.tableView.delegate = self.arrayDelegate as? UITableViewDelegate
        
        self.title = title
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
