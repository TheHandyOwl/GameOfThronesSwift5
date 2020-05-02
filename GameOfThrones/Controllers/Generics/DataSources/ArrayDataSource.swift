//
//  ArrayDataSource.swift
//  GameOfThrones
//
//  Created by Carlos on 28/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

final class ArrayDataSource <Element> : NSObject, UITableViewDataSource {
    
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker) {
        (self._model, self._cellMaker) = (model, cellMaker)
        super.init()
    }
    
    func element(atIndexPath indexPath: IndexPath) -> Element{
        return _model[indexPath.row]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = _model.count
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let element = _model[indexPath.row]
        return _cellMaker(element, tableView)
    }
    
}
