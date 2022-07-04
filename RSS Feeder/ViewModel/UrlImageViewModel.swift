//
//  UrlImageViewModel.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/02.
//

import Foundation

final class UrlImageViewModel: ObservableObject {
	@Published var downloadData: Data? = nil
	let url: String
	
	init(url: String, isSync: Bool = false) {
		self.url = url
		if isSync {
			self.downloadImageSync(url: self.url)
		} else {
			self.downloadImageAsync(url: self.url)
		}
	}
	
	func downloadImageAsync(url: String) {
		guard let imageUrl = URL(string: url) else {
			return
		}
		
		DispatchQueue.global().async {
			let data = try? Data(contentsOf: imageUrl)
			DispatchQueue.main.async {
				self.downloadData = data
			}
		}
	}
	
	func downloadImageSync(url: String) {
		guard let imageUrl = URL(string: url) else {
			return
		}
		
		let data = try? Data(contentsOf: imageUrl)
		self.downloadData = data
	}
}
