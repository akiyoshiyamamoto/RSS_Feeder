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
			// listでplistから取得したデータをSearchRssLIstRow
			List(model.webSites) { webSite in
				SearchRssListRowView(webSite: webSite)
			} 
		}
	}
}

struct SearchRssView_Previews: PreviewProvider {
	static var previews: some View {
		SearchRssView()
	}
}
