//
//  Delegates.swift
//  GameOfThrones
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate <Element> : NSObject {
    var source : ArrayDataSource <Element>?
    var viewController : UIViewController?
}

final class HousesDelegate : BaseViewControllerDelegate <House>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController {
            let VC = HouseViewController(model: house)
            nav.pushViewController(VC, animated: true)
        }
    }
        
}
