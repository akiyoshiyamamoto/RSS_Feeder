//
//  SearchRssView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/01.
//

import SwiftUI

struct SearchRssView: View {
	@StateObject var model = WebSiteViewModel()
	
	var body: some View {
		NavigationView {
			List {
				Section(header: Text("Featured Categories")) {
					CategoriesView()
				}
				
				Section(header: Text("Explore the Web")) {
					ForEach(model.webSites) { website in
						SearchRssListRowView(webSite: website)
					}
				}
			}
		}
	}
}

struct SearchRssView_Previews: PreviewProvider {
	static var previews: some View {
		SearchRssView()
	}
}
