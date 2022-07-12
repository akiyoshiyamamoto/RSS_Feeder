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
	
	enum CodingKeys: String, CodingKey {
		case status
		case feed
		case items
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.status = try container.decode(String.self, forKey: .status)
		self.feed = try container.decode(Feed.self, forKey: .feed)
		self.items = try container.decode([RssItem].self, forKey: .items)
	}
}

struct Feed: Decodable { // see https://rss2json.com/#rss_url=https%3A%2F%2Fwww.fashionsnap.com%2Frss.xml
	var url: String
	var title: String
	var link: String
	var author: String
	var description: String
	var image : String
}

struct RssItem: Identifiable {
	var id = UUID()
	var title: String
	var pubDate: String
	var link: String
	var guid: String
	var author: String
	var thumbnail: String
	var description: String
	
	init(title: String, pubDate: String, link: String, guid: String, author: String, thumbnail: String, description: String) {
		self.title = title
		self.pubDate = pubDate
		self.link = link
		self.guid = guid
		self.author = author
		self.thumbnail = thumbnail
		self.description = description
	}
	
	
}

extension RssItem: Decodable {
	enum CodingKeys: String, CodingKey {
		case title
		case pubDate
		case link
		case guid
		case author
		case thumbnail
		case description
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decode(String.self, forKey: .title)
		pubDate = try values.decode(String.self, forKey: .pubDate)
		link = try values.decode(String.self, forKey: .link)
		guid = try values.decode(String.self, forKey: .guid)
		author = try values.decode(String.self, forKey: .author)
		thumbnail = try values.decode(String.self, forKey: .thumbnail)
		description = try values.decode(String.self, forKey: .description)
	}
}
