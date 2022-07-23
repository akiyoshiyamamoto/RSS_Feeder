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
			}
			.navigationBarTitle("RSS Feeder")
			.navigationBarItems(trailing: NavigationLink(destination: SearchRssView())
								{
				Image(systemName: "plus")
					.frame(width: 10, height: 10)
					.foregroundColor(.gray)
			})
		}
		.onAppear() {
			for i in 0..<bookmarks.count {
				self.rssStore.fetchLatestRss(url: bookmarks[i].url!)
			}
		}
	}
}
