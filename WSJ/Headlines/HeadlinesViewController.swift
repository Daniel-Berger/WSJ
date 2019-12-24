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
    var navBarTitle = String()
    private var rssItems: [RSSItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headlinesTableView.dataSource = self
        self.headlinesTableView.delegate = self
        print("third: \(navBarTitle)")
        urlTest()
        
//        fetchData(url: "https://developer.apple.com/news/rss/news.rss")
        fetchData(url: "https://feeds.a.dj.com/rss/RSSOpinion.xml")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("fourth: \(navBarTitle)")
        self.navigationItem.title = navBarTitle
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
    
    func urlTest() {
        print("over here")
        let url = URL(string: "https://feeds.a.dj.com/rss/RSSOpinion.xml")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                DispatchQueue.main.sync {
                    let alertController = UIAlertController(title: "Network Error", message: "There was a network error: \(error!)", preferredStyle: .alert)
                    let actionOne = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertController.addAction(actionOne)
                    self.present(alertController, animated: true, completion: nil)
                }
                return
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            print("data was success: \(data)")
        }
        task.resume()
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
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
