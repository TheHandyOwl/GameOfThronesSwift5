//
//  SeasonViewController.swift
//  GameOfThrones
//
//  Created by Carlos on 02/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {

    @IBOutlet weak var seasonNameView: UILabel!
    @IBOutlet weak var seasonReleaseDate: UILabel!
    @IBOutlet weak var seasonEpisodesDescription: UITextView!
    
    let model : Season
    
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = model.description
        
        setupToolbar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    @objc func sayMyName() {
        let alert = UIAlertController(title: "Say my name:", message: model.name, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func sayMyInfo() {
        let alert = UIAlertController(
            title: "More info:",
            message: model.episodes.reduce("", { $0 + $1.description + "\n" }),
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func setupToolbar() {
        let seasonButton = UIBarButtonItem(
            title: "Name",
            style: .plain,
            target: self,
            action: #selector(sayMyName))
        
        let episodesButton = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(sayMyInfo))
        
        navigationItem.rightBarButtonItems = [seasonButton, episodesButton]
    }
    
    func setupUI() {
        seasonNameView.text = "Season: \(model.name)"
        seasonReleaseDate.text = "Premiere date: \(model.releaseDate.formatDate2StringYYYYMMdd())"
        let episodesText = model.episodes.reduce("Episodes: \n", { $0 + $1.description + "\n" })
        seasonEpisodesDescription.text = "\(episodesText)"
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
