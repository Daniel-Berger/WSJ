//
//  HeadlinesViewController.swift
//  WSJ
//
//  Created by dberger1 on 12/23/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

class HeadlinesViewController: UIViewController, XMLParserDelegate {

    @IBOutlet weak var headlinesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.headlinesTableView.dataSource = self
        self.headlinesTableView.delegate = self
    }

}

extension HeadlinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
