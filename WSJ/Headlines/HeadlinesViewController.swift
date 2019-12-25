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
    var selectedArticleURL = ""
    var selectedArticleLink = ""
    private var rssItems: [RSSItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headlinesTableView.dataSource = self
        self.headlinesTableView.delegate = self
        fetchData(url: selectedArticleURL)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
   
    private func fetchData(url: String) {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: url) { (rssItems) in
            self.rssItems = rssItems
            OperationQueue.main.addOperation {
                self.headlinesTableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "article segue" {
            if let destVC = segue.destination as? ArticleViewController {
//                destVC.articleSelectedURL = "https://wsj.com/"
                print("selectedArticleURL: \(selectedArticleURL)")
                print("selectedArticleLink: \(selectedArticleLink)")
                destVC.articleSelectedURL = selectedArticleLink
            }
        }
    }

}

extension HeadlinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        return rssItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headlines cell", for: indexPath) as! HeadlinesTableViewCell
        if let item = rssItems?[indexPath.item] {
            cell.item = item
        
//            selectedArticleLink = cell.item.link
//            print("1- selectedArticleLink: \(selectedArticleLink)")
//            let cellLink = cell.linkLabel.text
//            print("2- cellLink: \(cellLink)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedCell = tableView.cellForRow(at: indexPath) as? HeadlinesTableViewCell
        let selectedCellLink = selectedCell?.linkLabel.text
        print("3- selectedCellLink: \(selectedCellLink)")
        selectedArticleLink = selectedCell!.linkLabel.text!
        performSegue(withIdentifier: "article segue", sender: nil)
    }
}
