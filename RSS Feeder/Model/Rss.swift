//
//  Article.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import Foundation

struct Rss: Decodable {
  var status: String
  var feed: Feed
  var items: [RssItem]
}

struct Feed: Decodable { // see https://rss2json.com/#rss_url=https%3A%2F%2Fwww.fashionsnap.com%2Frss.xml
  var url: String
  var title: String
  var link: String
  var author: String
  var description: String
  var image : String
}

struct RssItem: Decodable, Identifiable {
  var id: Int
  var title: String
  var pubDate: String
  var link: String
  var guid: String
  var author: String
  var thumbnail: String
  var description: String
}

