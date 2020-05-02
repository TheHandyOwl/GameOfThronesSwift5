//
//  PersonViewController.swift
//  GameOfThrones
//
//  Created by Carlos on 02/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var personNameView: UILabel!
    @IBOutlet weak var personAliasView: UILabel!
    @IBOutlet weak var personHouseView: UILabel!
    
    // Model
    let model : Person
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
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
        syncViewWithModel()
    }
    
    func syncViewWithModel() {
        personNameView.text = "Name: " + model.name
        personAliasView.text = "Alias: " + model.alias
        personHouseView.text = "House: " + model.house.name
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
