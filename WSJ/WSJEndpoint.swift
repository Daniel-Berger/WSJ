//
//  WSJEndpoints.swift
//  WSJ
//
//  Created by dberger1 on 12/23/19.
//  Copyright © 2019 dberger1. All rights reserved.
//
// http://online.wsj.com/public/page/rss_news_and_feeds.html

import Foundation

class WSJEndpointString {
    // URL(string: <#T##String#>, relativeTo: <#T##URL?#>)
    let opinionRSS = "https://feeds.a.dj.com/rss/RSSOpinion.xml"
    let worldNewsRSS = "https://feeds.a.dj.com/rss/RSSWorldNews.xml"
    let usBusinessRSS = "https://feeds.a.dj.com/rss/WSJcomUSBusiness.xml"
    let marketNewsRSS = "https://feeds.a.dj.com/rss/RSSMarketsMain.xml"
    let technologyRSS = "https://feeds.a.dj.com/rss/RSSWSJD.xml"
    let lifestyleRSS = "https://feeds.a.dj.com/rss/RSSLifestyle.xml"
}

//enum WSJEndpoints {
//    case opinionRSS
//    case worldNewsRSS
//    case usBusinessRSS
//    case marketNewsRSS
//    case technologyRSS
//    case lifestyleRSS
//}
