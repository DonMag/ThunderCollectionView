import UIKit

class Section2: UICollectionViewCell {
	
	// DonMag - used in systemLayoutSizeFitting() for auto-sizing cells
	lazy var width: NSLayoutConstraint = {
		let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
		width.isActive = true
		return width
	}()
	
	static let tableSubCellId = "tableSubCellId"
	
	// DonMag - use ContentSizedTableView subclass of UITableView
	private weak var tableView: ContentSizedTableView!

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupTableView()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupTableView() {
		// DonMag - use ContentSizedTableView subclass of UITableView
		let tableView = ContentSizedTableView(frame: self.frame, style: .plain)
		
		tableView.backgroundColor = .clear
		tableView.isScrollEnabled = false
		tableView.allowsSelection = false
		tableView.separatorColor = .gray
		tableView.register(TableHeaderView.self, forHeaderFooterViewReuseIdentifier: TableHeaderView.headerCellId)
		tableView.register(TableViewCell.self, forCellReuseIdentifier: Section2.tableSubCellId)
		
		// DonMag - we'll be using contentView ... so disable translates...
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		// DonMag - add table view to contentView ... NOT to self
		contentView.addSubview(tableView)
		
		self.tableView = tableView
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		
		// DonMag - constrain to contentView ... NOT to self
		self.tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		self.tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		self.tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
		self.tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
		
		tableView.separatorColor = .gray
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}
	
	// DonMag - used for auto-sizing collectionView cell
	override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
		width.constant = bounds.size.width
		return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
	}
}

extension Section2: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return UITableView.automaticDimension
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 51.0
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = TableHeaderView()
		header.summary.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lectus orci, dapibus a quam ut, aliquam consequat libero. Vestibulum ac velit eleifend, suscipit eros ut, convallis sem. Duis dignissim vehicula fringilla. Integer et diam id nulla interdum facilisis. Nunc pulvinar neque massa, sit amet cursus metus dignissim in. Ut enim dolor, luctus in elit egestas, venenatis faucibus diam. Donec id tempus metus. Ut consequat elit vel tortor ullamcorper convallis. Duis tincidunt magna vel risus molestie, eget ultrices massa congue. Sed lacinia, diam eget iaculis luctus, augue risus molestie lorem, et hendrerit elit magna in odio. Nam lobortis lectus sit amet orci fermentum vulputate. Maecenas dictum vitae nisl at vestibulum. Donec commodo mi gravida lectus dictum, vel pulvinar tellus feugiat. Nam quis auctor velit."
		return header
	}
}

extension Section2: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Section2.tableSubCellId, for: indexPath) as! TableViewCell
		switch indexPath.row {
		case 0:
			cell.set(key: "Key1", value: "Value1")
		case 1:
			cell.set(key: "Key2", value: "Value2")
		case 2:
			cell.set(key: "Key3", value: "Value3")
		case 3:
			cell.set(key: "Key4", value: "Value4")
		case 4:
			cell.set(key: "Key5", value: "Value5")
		default:
			fatalError("Unknown table row!")
		}
		return cell
	}
}
