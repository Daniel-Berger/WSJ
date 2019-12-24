//
//  Headline.swift
//  WSJ
//
//  Created by dberger1 on 12/24/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import Foundation

class Headline {
    
    var title: String
    var description: String
    var link: String
    
    init(title: String, description: String, link: String) {
        self.title = title
        self.description = description
        self.link = link
    }
}
