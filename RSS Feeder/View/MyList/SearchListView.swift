//
//  SearchListView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/08/03.
//

import SwiftUI

struct SearchListView: View {
	@StateObject var webSiteViewModel = WebSiteViewModel()
	var sectionTitle: String
	var hashTag = ""
	
    var body: some View {
		Section(header: Text(sectionTitle)) {
			ForEach(webSiteViewModel.webSites.filter { $0.hashTag == self.hashTag}) { website in
				SearchRssListRowView(webSite: website)
			}
		}
    }
}

