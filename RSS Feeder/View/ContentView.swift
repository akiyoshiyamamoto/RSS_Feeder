//
//  ContentView.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var articles: [Article] = [
        Article(id: 1, headline: "This is Test Headline", imgUrl: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/biwotsutaeru-person-2nd-01.jpg", websiteName: "fashionsnap.com", text: "This is Text"),
        Article(id: 2, headline: "This is Test Headline", imgUrl: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/biwotsutaeru-person-2nd-01.jpg", websiteName: "fashionsnap.com", text: "This is Text")
    ]
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    ListRowView(article: article)
                }
            }
            .navigationBarTitle("RSS Feeder")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
