//
//  RssStore.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/06/28.
//

import Foundation

class RssStore: Decodable, ObservableObject {
  @Published var items: [RssItem] = []
  private static var rssUrl = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.fashionsnap.com%2Frss.xml"
  
  enum CodingKeys: CodingKey {
    case items
  }
  
  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    items = try values.decode([RssItem].self, forKey: .items)
  }
  
  init() {
    
  }
  
  func fetchLatestRss() {
    guard let rssUrl = URL(string: Self.rssUrl) else {
      return
    }
    
    let request = URLRequest(url: rssUrl)
    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
      if let error = error {
        print("failed Request with \(error)")
        return
      }
      
      if let data = data {
        DispatchQueue.main.async {
          self.items = self.parseJsonData(data: data)
        }
        
      }
      
    })
    
    task.resume()
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
