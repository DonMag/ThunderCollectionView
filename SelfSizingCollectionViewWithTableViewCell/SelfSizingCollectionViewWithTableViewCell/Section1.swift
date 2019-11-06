import UIKit

class Section1: UICollectionViewCell {
	private let images: [URL]
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 0.0
		layout.minimumLineSpacing = 15.0
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(ImageThumbnailCell.self, forCellWithReuseIdentifier: ImageThumbnailCell.imageCellId)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .clear
		return collectionView
	}()

	override init(frame: CGRect) {
		self.images = [
			URL(string: "https://images.blz-contentstack.com/v3/assets/blt3452e3b114fab0cd/blt0a70f219593379ea/5dbb292924642a3b8da56e09/Wallpaper_1920x1080_-_Cinematic_1.jpg")!,
			URL(string: "https://images.blz-contentstack.com/v3/assets/blt3452e3b114fab0cd/blt0a70f219593379ea/5dbb292924642a3b8da56e09/Wallpaper_1920x1080_-_Cinematic_1.jpg")!,
			URL(string: "https://images.blz-contentstack.com/v3/assets/blt3452e3b114fab0cd/blt0a70f219593379ea/5dbb292924642a3b8da56e09/Wallpaper_1920x1080_-_Cinematic_1.jpg")!,
			URL(string: "https://images.blz-contentstack.com/v3/assets/blt3452e3b114fab0cd/blt0a70f219593379ea/5dbb292924642a3b8da56e09/Wallpaper_1920x1080_-_Cinematic_1.jpg")!
		]
		super.init(frame: frame)
		self.backgroundColor = .clear
		self.setupViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupViews() {
		self.collectionView.dataSource = self
		self.collectionView.delegate = self

		self.addSubview(self.collectionView)

		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-0-[v0]-0-|",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.collectionView]
			)
		)
		self.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "V:|-0-[v0]-0-|",
				options: [.directionLeadingToTrailing],
				metrics: nil,
				views: ["v0": self.collectionView]
			)
		)
	}
}

// MARK: - UICollectionViewDataSource
extension Section1: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageThumbnailCell.imageCellId, for: indexPath) as! ImageThumbnailCell
		let imageUrl = self.images[indexPath.item]
		URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
			guard let data = data, error == nil else { return }
			DispatchQueue.main.async() {
				cell.imageView.image = UIImage(data: data)
			}
		}.resume()
		return cell
	}
}

// MARK: - UICollectionViewDelegate
extension Section1: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 20.0, bottom: 0, right: 20.0)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension Section1: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 366.0, height: self.frame.height)
	}
}
