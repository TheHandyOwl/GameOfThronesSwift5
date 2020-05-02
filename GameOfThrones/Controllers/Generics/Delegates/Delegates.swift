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

final class PersonsDelegate : BaseViewControllerDelegate <Person>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let person = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController {
            let VC = PersonViewController(model: person)
            nav.pushViewController(VC, animated: true)
        }
    }
        
}

final class SeasonsDelegate : BaseViewControllerDelegate <Season>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let season = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController {
            let VC = SeasonViewController(model: season)
            nav.pushViewController(VC, animated: true)
        }
    }
        
}

final class EpisodesDelegate : BaseViewControllerDelegate <Episode>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController {
            let VC = EpisodeViewController(model: episode)
            nav.pushViewController(VC, animated: true)
        }
    }
        
}
