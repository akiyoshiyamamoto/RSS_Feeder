//
//  Article.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import Foundation

struct Category: Decodable, Identifiable {
	var id = UUID()
	var name: String
	var image: String
	var hashTag: String
	
	private enum CodingKeys: String, CodingKey {
		case name
		case image
		case hashTag
	}
}
