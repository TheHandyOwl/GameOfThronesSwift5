//
//  DataSources.swift
//  GameOfThrones
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

final class DataSources {
    
    static func houseDateSource(model: [House]) -> ArrayDataSource <House> {
        return ArrayDataSource(model: model) { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = house.name
            cell?.imageView?.image = house.sigil.image
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        }
    }
    
    static func personDateSource(model: [Person]) -> ArrayDataSource <Person> {
        return ArrayDataSource(model: model) { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            cell?.detailTextLabel?.text = person.alias
            
            return cell!
        }
    }
    
}
