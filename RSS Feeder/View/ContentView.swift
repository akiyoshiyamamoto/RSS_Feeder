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
        }
        .onAppear() {
          self.rssStore.fetchLatestRss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
