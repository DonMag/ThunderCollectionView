import UIKit

class TableHeaderView: UITableViewHeaderFooterView {
	static let headerCellId = "headerCellId"
	let summary: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Lato-Light", size: 17.0)
		label.textColor = .white
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .justified
		return label
	}()

	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		self.tintColor = .clear
		self.addSubview(self.summary)
		self.summary.translatesAutoresizingMaskIntoConstraints = false

		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-20-[v0]-20-|",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.summary]
			)
		)
		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "V:|-[v0]-|",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.summary]
			)
		)
	}
}
