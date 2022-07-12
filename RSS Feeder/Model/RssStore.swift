//
//  RssStore.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/06/28.
//

import Foundation
import SwiftUI

class RssStore: Decodable, ObservableObject {
	@Published var items: [RssItem] = []
	private static var rssUrl = ""
	
	enum CodingKeys: CodingKey {
		case items
	}
	
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		items = try values.decode([RssItem].self, forKey: .items)
	}
	
	init() {
	}
	
	func fetchLatestRss(urls: Array<String>) {
		
		for i in 0..<urls.count {
			guard let rssUrl = URL(string: urls[i]) else {
				continue
			}
			
			let request = URLRequest(url: rssUrl)
			let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
				if let error = error {
					print("failed Request with \(error)")
					return
				}
				
				if let data = data {
					DispatchQueue.main.async {
						self.items += self.parseJsonData(data: data)
					}
					
				}
				
			})
			
			task.resume()
		}
	}
	
	func parseJsonData(data: Data) -> [RssItem] {
		let decoder = JSONDecoder()
		
		do {
			let rssStore = try decoder.decode(RssStore.self, from: data)
			self.items = rssStore.items
		} catch {
			print("failed decode with \(error)")
		}
		
		return items
	}
	
}
