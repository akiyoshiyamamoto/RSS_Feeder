//
//  DetailView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/16.
//

import SwiftUI

struct DetailView: View {
	var item: RssItem
    var body: some View {
		VStack {
			Text(item.title)
				.bold()
				.font(.system(.title, design: .rounded))
			
			Spacer()
			
			HStack {
				Text(item.author)
					.font(.system(.caption, design: .rounded))
				Text(item.pubDate)
					.font(.system(.caption, design: .rounded))
			}
		
			Spacer()
			
			AsyncImage(url: URL(string: item.thumbnail))
				.frame(maxWidth: .infinity)
				.cornerRadius(15)
				.background(Color(.white))
			
			Spacer()
			
			Text(item.description)
				.font(.system(.body, design: .rounded))
			
			Button(action: {
				presentWebsite(url: item.link)
			}, label: {
				Text("Visit Website")
			})
		}
		.padding(.horizontal, 5)
    }
	
	func presentWebsite(url: String)
	{
		if let url = URL(string: url) {
			UIApplication.shared.open(url)
		}
	}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(item: RssItem(title: "彫師でありながら現役藝大院生　アーティスト佐藤はなえが提案する「1mmタトゥー」", pubDate: "2020-10-12", link: "https://www.fashionsnap.com/article/hanaesato-interview/", guid: "https://www.fashionsnap.com/article/hanaesato-interview/", author: "", thumbnail: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/1mmtatoo-interview_022.jpg", description: " アーティストの佐藤はなえは、東京藝術大学美術学部絵画科油絵専攻を修了後、同大学院で美術解剖学を学ぶ24歳だ。彫師でありながらも現役の藝大院生。"))
    }
}
