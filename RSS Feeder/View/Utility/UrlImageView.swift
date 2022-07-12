//
//  UrlImageView.swift
//  RSS Feeder
//
//  Created by yamamotoakiyoshi on 2022/07/02.
//

import SwiftUI

struct UrlImageView: View {
	@ObservedObject var viewModel: UrlImageViewModel
	var body: some View {
		if let imageData = self.viewModel.downloadData {
			if let image = UIImage(data: imageData) {
				return Image(uiImage: image).resizable()
			} else {
				return Image(uiImage: UIImage()).resizable()
			}
		} else {
			return Image(uiImage: UIImage()).resizable()
		}
	}
}
