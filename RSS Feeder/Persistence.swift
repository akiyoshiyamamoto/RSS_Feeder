//
//  Persistence.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import CoreData

class PersistenceController: ObservableObject {
	static let shared = PersistenceController()
    let container = NSPersistentContainer(name: "Bookmark")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
			
		}
	}
}
