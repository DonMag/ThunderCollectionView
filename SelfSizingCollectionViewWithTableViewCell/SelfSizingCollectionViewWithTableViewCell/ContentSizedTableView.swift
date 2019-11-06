//
//  ContentSizedTableView.swift
//  SelfSizingCollectionViewWithTableViewCell
//
//  Created by Don Mag on 11/6/19.
//  Copyright © 2019 SO. All rights reserved.
//

import UIKit

final class ContentSizedTableView: UITableView {
	override var contentSize:CGSize {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}
	override var intrinsicContentSize: CGSize {
		layoutIfNeeded()
		return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
	}
}
