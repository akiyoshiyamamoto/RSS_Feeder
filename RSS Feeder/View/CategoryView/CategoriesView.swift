//
//  CategoriesView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/25.
//

import SwiftUI

struct CategoriesView: View {
	@StateObject var viewModel = CategoryViewModel()
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
					ForEach(viewModel.categories) { category in
						NavigationLink(destination: SearchListView(sectionTitle: "Explore Web", hashTag: category.hashTag)) {
							CardView(category: category)
						}
				}
			}
		}
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
