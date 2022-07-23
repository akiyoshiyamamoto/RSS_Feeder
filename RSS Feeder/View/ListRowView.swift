//
//  ListRowView.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI

struct ListRowView: View {
	var item: RssItem
	var body: some View {
		HStack {
			VStack {
				Text(item.title)
					.font(.system(size: 14, design: .rounded))
					.bold()
					.frame(maxWidth: .infinity, minHeight: 90)
					.multilineTextAlignment(.leading)
				
				Spacer()
				
				Text(item.pubDate)
					.lineLimit(1)
					.font(.system(size: 10, design: .rounded))
					.frame(height: 10)
			}
			
			AsyncImage(url: URL(string: item.thumbnail))
				.frame(width: 120, height: 100)
				.cornerRadius(5)
				.background(Color(.white))
		}
		.frame(maxHeight: 100)
	}
}

struct ListRowView_Previews: PreviewProvider {
	static var previews: some View {
		ListRowView(item: RssItem(title: "彫師でありながら現役藝大院生　アーティスト佐藤はなえが提案する「1mmタトゥー」", pubDate: "2020-10-12", link: "https://www.fashionsnap.com/article/hanaesato-interview/", guid: "https://www.fashionsnap.com/article/hanaesato-interview/", author: "田中康太", thumbnail: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/1mmtatoo-interview_022.jpg", description: " アーティストの佐藤はなえは、東京藝術大学美術学部絵画科油絵専攻を修了後、同大学院で美術解剖学を学ぶ24歳だ。彫師でありながらも現役の藝大院生。"))
	}
}
