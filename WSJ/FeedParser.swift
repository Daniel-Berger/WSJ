//
//  FeedParser.swift
//  WSJ
//
//  Created by dberger1 on 12/24/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit

struct RSSItem {
    var title: String
    var description: String
    var pubDate: String
}

class FeedParser: NSObject, XMLParserDelegate {
    
    private var rssItems: [RSSItem] = []
    private var currentElement: String = ""
    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler: (([RSSItem]) -> Void)?
    
    func parseFeed(url: String, completionHandler: (([RSSItem]) -> Void)?) {
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            
//            guard error == nil else {
//                DispatchQueue.main.sync {
//                    let alertController = UIAlertController(title: "Network Error", message: "There was a network error: \(error!)", preferredStyle: .alert)
//                    let actionOne = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//                    alertController.addAction(actionOne)
//                    self.present(alertController, animated: true, completion: nil)
//                }
//                return
//            }
            
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    // MARK: XML Parser Delegate
    // gets called when the opening tag gets parsed
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        if currentElement == "item" { // item is a key in the xml doc
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
            
        }
    }
    
    // gets called when the data in the tag gets parsed
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch currentElement {
        case "title": // title is the key
            currentTitle += string
        case "description":
            currentDescription += string
        case "pubDate":
            currentPubDate += string
        default:
            break
        }
    }
 
    // gets called when the the parser reaches the end of the tag
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, description: currentDescription, pubDate: currentPubDate)
            self.rssItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Parse error: \(parseError.localizedDescription)")
    }
}

