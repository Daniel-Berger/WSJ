//
//  HeadlinesTableViewCell.swift
//  WSJ
//
//  Created by dberger1 on 12/20/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

class HeadlinesTableViewCell: UITableViewCell {

    @IBOutlet weak var headlinesLabel: UILabel!
    
    func setHeadlines(article: Article) {
        headlinesLabel.text = article.title
    }

}
