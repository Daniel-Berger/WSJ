//
//  WSJEndpoints.swift
//  WSJ
//
//  Created by dberger1 on 12/23/19.
//  Copyright © 2019 dberger1. All rights reserved.
//
// http://online.wsj.com/public/page/rss_news_and_feeds.html

import Foundation

class WSJEndpoints {
    // URL(string: <#T##String#>, relativeTo: <#T##URL?#>)
    let opinionRSS = URL(string: "https://feeds.a.dj.com/rss/RSSOpinion.xml")
    let worldNewsRSS = URL(string: "https://feeds.a.dj.com/rss/RSSWorldNews.xml")
    let usBusinessRSS = URL(string: "https://feeds.a.dj.com/rss/WSJcomUSBusiness.xml")
    let marketNewsRSS = URL(string: "https://feeds.a.dj.com/rss/RSSMarketsMain.xml")
    let technologyRSS = URL(string: "https://feeds.a.dj.com/rss/RSSWSJD.xml")
    let lifestyleRSS = URL(string: "https://feeds.a.dj.com/rss/RSSLifestyle.xml")
}
