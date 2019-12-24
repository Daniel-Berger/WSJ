//
//  ViewController.swift
//  WSJ
//
//  Created by dberger1 on 12/20/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

class HeadlinesViewController: UIViewController {

    var headlines = [Article]()
    
    @IBOutlet weak var headlinesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.headlinesTableView.dataSource = self
//        self.headlinesTableView.delegate = self
        
        createArticleArray()
    }

    func createArticleArray() -> [Article] {
        var finalArticles: [Article] = []
        
        let firstArticle = Article(title: "First Article")
        let secondArticle = Article(title: "Second Article")
        let thirdArticle = Article(title: "Third Article")
        let fourthArticle = Article(title: "Fourth Article")
        let fifthArticle = Article(title: "Fifth Article")
        
        finalArticles.append(firstArticle)
        finalArticles.append(secondArticle)
        finalArticles.append(thirdArticle)
        finalArticles.append(fourthArticle)
        finalArticles.append(fifthArticle)
        
        return finalArticles
    }

}
/*
// MARK: UITableViewDataSource
extension HeadlinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //TODO: How many times is this method called
        let article = headlines[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "headlines cell", for: indexPath) as! HeadlinesTableViewCell
        cell.setHeadlines(article: article)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "article segue", sender: self)
    }
    
}
*/
