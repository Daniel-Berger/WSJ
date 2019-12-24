//
//  HeadlinesTableViewCell.swift
//  WSJ
//
//  Created by dberger1 on 12/24/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

class HeadlinesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    
//    func setupHeadline(headline: Headline) {
//        titleLabel.text = headline.title
//        descriptionLabel.text = headline.description
//    }
    
    var item: RSSItem! {
        didSet {
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            pubDateLabel.text = item.pubDate
        }
    }
}

