//
//  File.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/02.
//

import SwiftUI

struct WebSite: Decodable,Identifiable {
	var id = UUID()
	let siteName, siteUrl, url, favicon: String, hashTag: String
	
	private enum CodingKeys: String, CodingKey {
		case siteName
		case siteUrl
		case url
		case favicon
		case hashTag
	}
}
