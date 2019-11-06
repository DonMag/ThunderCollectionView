import UIKit

class SectionHeaderView: UICollectionReusableView {
	static let sectionHeaderId = "sectionHeaderId"
	let uiLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 21.0)
		label.textColor = .white
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		self.backgroundColor = .clear
		self.addSubview(uiLabel)
		self.uiLabel.translatesAutoresizingMaskIntoConstraints = false

		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-20-[v0]",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0" : uiLabel]
			)
		)
		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "V:|-30-[v0]",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0" : uiLabel]
			)
		)
	}
}
