//
//  WebSiteViewModel.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/04.
//

import Foundation

final class CategoryViewModel: ObservableObject {
	@Published var categories: [Category] = []
	
	init() {
		loadCategories()
	}
	
	func loadCategories(){
		guard let url = Bundle.main.url(forResource: "Categories", withExtension: "plist"), let data = try? Data(contentsOf: url) else {
			return
		}
		
		do {
			categories = try PropertyListDecoder().decode([Category].self, from: data)
		} catch {
			print("失敗したああああああ？\(error)")
			categories = []
		}
	}
}
