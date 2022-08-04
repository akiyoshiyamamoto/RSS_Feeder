//
//  SearchRssView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/01.
//

import SwiftUI

struct SearchRssView: View {
	@State var hashTag = ""
	@StateObject var model = WebSiteViewModel()
	
	var body: some View {
		NavigationView {
			List {
				Section(header: Text("Featured Categories")) {
					CategoriesView()
				}
				
				SearchListView(sectionTitle: "Explore web")
			}
		}
	}
}
