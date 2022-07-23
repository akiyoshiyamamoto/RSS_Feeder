//
//  ContentView.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
	var body: some View {
		TabView{
			FeederView()
				.tabItem {
					VStack {
						Image(systemName: "square.stack.3d.up")
							.frame(width: 10, height: 10)
							.foregroundColor(.gray)
					}
				}.tag(1)
			SearchRssView()
				.tabItem {
					VStack {
						Image(systemName: "plus")
							.frame(width: 10, height: 10)
							.foregroundColor(.gray)
					}
				}.tag(2)
		}
	}
}
