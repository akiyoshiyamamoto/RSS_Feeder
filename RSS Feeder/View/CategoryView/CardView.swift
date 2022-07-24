//
//  CardView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/24.
//

import SwiftUI

struct CardView: View {
	var category: Category
    var body: some View {
		ZStack(alignment: .top) {
			Spacer()
			
			Image(category.image)
				.resizable()
				.scaledToFill()
				.frame(width: 150, height: 200)
				.background(Color("exGreen"))
			
			Text(category.name)
				.font(.caption)
				.foregroundColor(.gray)
				.bold()
				.offset(x:0, y: 15)
		}
		.cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(category: Category(name: "category name", image: "science", hashTag: "#サイエンス"))
    }
}
