//
//  EpisodeViewController.swift
//  GameOfThrones
//
//  Created by Carlos on 02/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var seasonNameView: UILabel!
    @IBOutlet weak var seasonReleaseDate: UILabel!
    @IBOutlet weak var seasonEpisodesDescription: UILabel!
    
    let model : Episode
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = model.description
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
    
    func setupUI() {
        seasonNameView.text = "Season: \(model.episodeFromSeason.name)"
        seasonReleaseDate.text = "Episode: \(model.title)"
        seasonEpisodesDescription.text = "Bradcast Date: \(model.broadcastDate.formatDate2StringYYYYMMdd())"
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
