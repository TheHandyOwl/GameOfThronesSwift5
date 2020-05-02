//
//  WikiViewController.swift
//  GameOfThrones
//
//  Created by Carlos on 26/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
    
    @IBOutlet weak var browserView: WKWebView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let model : House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        syncViewWithModel()
    }
    
    func syncViewWithModel() {
        title = model.name
        
        browserView.navigationDelegate = self
        
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        
        browserView.load(URLRequest(url: model.url))
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

extension WikiViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
}
