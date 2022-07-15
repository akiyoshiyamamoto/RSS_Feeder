//
//  ContentView.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
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
			List {
				ForEach(rssStore.items) { item in
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
