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
          self.rssStore.fetchLatestRss()
        }
    }
}
