//
//  ListRowView.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI

struct ListRowView: View {
    var article: Article
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: article.imgUrl))
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .cornerRadius(15)
                .background(Color(.white))
            
            Text(article.headline)
                .font(.system(size: 20, design: .rounded))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                .padding(.top, 10)
            
            Text(article.websiteName)
                .font(.system(size: 16, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                .padding(.top, 5) 
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(article: Article(headline: "This is Test Headline", imgUrl: "https://res.fashionsnap.com/image/upload/w_300,h_300,c_fill,g_auto/asset/article/images/2022/06/biwotsutaeru-person-2nd-01.jpg", websiteName: "fashionsnap.com", text: "This is Text"))
    }
}
