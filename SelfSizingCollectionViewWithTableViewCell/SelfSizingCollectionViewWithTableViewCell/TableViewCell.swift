import UIKit

class TableViewCell: UITableViewCell {
	private let keyLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Lato-Light", size: 17.0)
		label.textColor = .white
		return label
	}()
	private let valueLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Lato-Light", size: 17.0)
		label.textColor = .white
		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		self.backgroundColor = .clear
		self.addSubview(self.keyLabel)
		self.addSubview(self.valueLabel)
		self.keyLabel.translatesAutoresizingMaskIntoConstraints = false
		self.valueLabel.translatesAutoresizingMaskIntoConstraints = false
		let bgColorView = UIView()
		bgColorView.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
		self.selectedBackgroundView = bgColorView

		self.addConstraints([
			NSLayoutConstraint(item: self.keyLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
			NSLayoutConstraint(item: self.valueLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
		])

		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-[v0]",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.keyLabel]
			)
		)
		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-150-[v0]",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.valueLabel]
			)
		)
	}

	func set(key: String, value: String) {
		self.keyLabel.text = key
		self.valueLabel.text = value
	}
}
