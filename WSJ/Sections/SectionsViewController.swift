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
    private var rowSelected: Int?
    
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
            if let destVC = segue.destination as? HeadlinesViewController {
                destVC.selectedArticleURL = getHeadlinesURL(rowSelected: rowSelected!)
            }
        }
    }
    
    private func getHeadlinesURL(rowSelected: Int) -> String {
        var resultString = "test"
        
        switch rowSelected {
        case 0:
            resultString = WSJEndpointString().opinionRSS
        case 1:
            resultString = WSJEndpointString().worldNewsRSS
        case 2:
            resultString = WSJEndpointString().usBusinessRSS
        case 3:
            resultString = WSJEndpointString().marketNewsRSS
        case 4:
            resultString = WSJEndpointString().technologyRSS
        case 5:
            resultString = WSJEndpointString().lifestyleRSS
        default:
            let alertController = UIAlertController(title: "Bad Selection", message: "Please select another row", preferredStyle: .alert)
            let actionOne = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(actionOne)
            self.present(alertController, animated: true, completion: nil)
        }
        return resultString
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
        self.rowSelected = indexPath.row
        performSegue(withIdentifier: "headlines segue", sender: nil)
    }
}

