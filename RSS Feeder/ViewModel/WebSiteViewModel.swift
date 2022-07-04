//
//  WebSiteViewModel.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/04.
//

import Foundation

final class WebSiteViewModel: ObservableObject {
	@Published var webSites: [WebSite] = []
	
	init() {
		loadWebsiteListData()
	}
	
	func loadWebsiteListData(){
		guard let url = Bundle.main.url(forResource: "RssList", withExtension: "plist"), let data = try? Data(contentsOf: url) else {
			return
		}
				
		do {
			webSites = try PropertyListDecoder().decode([WebSite].self, from: data)
		} catch {
			print("失敗したああああああ？\(error)")
			webSites = []
		}
	}
}
