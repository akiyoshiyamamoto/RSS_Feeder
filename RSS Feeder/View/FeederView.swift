//
//  FeederView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/23.
//

import SwiftUI

struct FeederView: View {
	@ObservedObject var rssStore = RssStore()
	@FetchRequest(
		entity: Bookmark.entity(),
		sortDescriptors: [NSSortDescriptor(keyPath: \Bookmark.id, ascending: true)],
		predicate: nil,
		animation: .default
	) var bookmarks: FetchedResults<Bookmark>
	@Environment(\.managedObjectContext) private var viewContext
	
	var body: some View {
		NavigationView {
			List(rssStore.items) {  item in
				NavigationLink(destination: DetailView(item: item)) {
					ListRowView(item: item)
				}
				.listRowSeparator(.hidden)
			}
			.navigationBarTitle("RSS Feeder")
			.listStyle(.plain)
		}
		.onAppear() {
			for i in 0..<bookmarks.count {
				self.rssStore.fetchLatestRss(url: bookmarks[i].url!)
			}
		}
	}
}
