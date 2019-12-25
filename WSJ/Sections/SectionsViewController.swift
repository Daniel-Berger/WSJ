//
//  SectionsViewController.swift
//  WSJ
//
//  Created by dberger1 on 12/23/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {
    
    @IBOutlet weak var sectionTableView: UITableView!
     var sections: [Section] = []
    var rowSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        sectionTableView.dataSource = self
        sectionTableView.delegate = self
        sections = setupSection()
    }

    private func setupSection() -> [Section] {
        var finalSection = [Section]()
        
        let firstSection = Section(title: "Opinion")
        let secondSection = Section(title: "World News")
        let thirdSection = Section(title: "U.S. Business")
        let fourthSection = Section(title: "Market News")
        let fifthSection = Section(title: "Technology: What's News")
        let sixthSection = Section(title: "Lifestyle")
        
        finalSection.append(firstSection)
        finalSection.append(secondSection)
        finalSection.append(thirdSection)
        finalSection.append(fourthSection)
        finalSection.append(fifthSection)
        finalSection.append(sixthSection)
        
        return finalSection
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "headlines segue" {
            
        }
    }
    
}

// MARK: UITableViewDataSource & UITableViewDelegate
extension SectionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = sections[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "section cell", for: indexPath) as! SectionTableViewCell
        cell.setupSection(section: currentSection)
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "headlines segue", sender: nil)
    }
}

