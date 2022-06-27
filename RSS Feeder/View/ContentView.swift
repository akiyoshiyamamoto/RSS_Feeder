//
//  ContentView.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var items: [RssItem] = [
      RssItem(id: 1, title: "彫師でありながら現役藝大院生　アーティスト佐藤はなえが提案する「1mmタトゥー」", pubDate: "2020-10-12", link: "https://www.fashionsnap.com/article/hanaesato-interview/", guid: "https://www.fashionsnap.com/article/hanaesato-interview/", author: "", thumbnail: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/1mmtatoo-interview_022.jpg", description: " アーティストの佐藤はなえは、東京藝術大学美術学部絵画科油絵専攻を修了後、同大学院で美術解剖学を学ぶ24歳だ。彫師でありながらも現役の藝大院生。"),
      RssItem(id: 2, title: "彫師でありながら現役藝大院生　アーティスト佐藤はなえが提案する「1mmタトゥー」", pubDate: "2020-10-12", link: "https://www.fashionsnap.com/article/hanaesato-interview/", guid: "https://www.fashionsnap.com/article/hanaesato-interview/", author: "", thumbnail: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/1mmtatoo-interview_022.jpg", description: " アーティストの佐藤はなえは、東京藝術大学美術学部絵画科油絵専攻を修了後、同大学院で美術解剖学を学ぶ24歳だ。彫師でありながらも現役の藝大院生。")
    ]
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ListRowView(item: item)
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
