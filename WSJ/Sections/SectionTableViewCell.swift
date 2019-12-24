//
//  SectionTableViewCell.swift
//  WSJ
//
//  Created by dberger1 on 12/23/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionLabel: UILabel!

    func setupSection(section: Section) {
        sectionLabel.text = section.title
    }
    
}
