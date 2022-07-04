//
//  SearchRssListRowView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/01.
//

import SwiftUI

struct SearchRssListRowView: View {
	var webSite: WebSite
    var body: some View {
      HStack(alignment: .center){
		  UrlImageView(viewModel: .init(url: webSite.favicon))
          .frame(width: 50, height: 50)
          .foregroundColor(.gray)
        
        VStack {
			Text(webSite.siteName)
            .font(.system(.caption, design: .rounded))
          
			Text(webSite.siteUrl)
            .font(.system(.caption2, design: .rounded))
        }
        
        Button(action: {
          print("pushed")
        }, label: {
          Image(systemName: "plus")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.gray)
        })
      }
      .padding(.vertical, 5)
    }
}

struct SearchRssListRowView_Previews: PreviewProvider {
    static var previews: some View {
		SearchRssListRowView(webSite: WebSite(siteName: "test", siteUrl: "test", url: "teswt", favicon: "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://togetter.com/"))
    }
}
