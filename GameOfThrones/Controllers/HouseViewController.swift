//
//  HouseViewController.swift
//  GameOfThrones
//
//  Created by Carlos on 24/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var houseWordsLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // Model
    let model : House
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        // Personalizando las pestañas tras el init
        self.title = model.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
        
    }

    func setupUI() {
        // Wiki
        let wiki = UIBarButtonItem(
            title: "Wiki",
            style: .plain,
            target: self,
            action: #selector(displayWiki))
        //Members
        let members = UIBarButtonItem(
            title: "Members",
            style: .plain,
            target: self,
            action: #selector(displayMembers))
        
        navigationItem.rightBarButtonItems = [members, wiki]
    }
    
    func syncViewWithModel() {
        houseNameLabel.text = "House: \(model.name)"
        sigilImageView.image = model.sigil.image
        houseWordsLabel.text = "\(model.words)"
    }
    
    @objc func displayWiki() {
        let wikiVC = WikiViewController(model: model)
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayMembers() {
        let VC = MembersTableViewController(model: model.sortedMembers())
        navigationController?.pushViewController(VC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
