import UIKit

class Section2: UICollectionViewCell {
	static let tableSubCellId = "tableSubCellId"
	private weak var tableView: UITableView!

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupTableView()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupTableView() {
		let tableView = UITableView(frame: self.frame, style: .plain)
		tableView.backgroundColor = .clear
		tableView.isScrollEnabled = false
		tableView.allowsSelection = false
		tableView.separatorColor = .gray
		tableView.register(TableHeaderView.self, forHeaderFooterViewReuseIdentifier: TableHeaderView.headerCellId)
		tableView.register(TableViewCell.self, forCellReuseIdentifier: Section2.tableSubCellId)
		self.addSubview(tableView)
		self.tableView = tableView
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
		tableView.separatorColor = .gray
		self.tableView.delegate = self
		self.tableView.dataSource = self
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
