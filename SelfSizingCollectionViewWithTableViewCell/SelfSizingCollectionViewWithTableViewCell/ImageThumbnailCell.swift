import UIKit

class ImageThumbnailCell: UICollectionViewCell {
	static let imageCellId = "imageCellId"
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 5.0
		imageView.layer.masksToBounds = true
		imageView.backgroundColor = .clear
		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .clear
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		self.imageView.image = nil
	}

	private func setupViews() {
		self.addSubview(self.imageView)
		self.imageView.translatesAutoresizingMaskIntoConstraints = false
		self.addConstraints([
			NSLayoutConstraint(item: self.imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 366.0),
			NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: self.imageView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
		])
		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "V:|-0-[v0(210)]",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.imageView]
			)
		)
	}
}
