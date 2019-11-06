import UIKit

class ViewController: UIViewController {
	static let section1 = "section1"
		static let section2 = "section2"
		private weak var collectionView: UICollectionView!

		override func viewDidLoad() {
			self.navigationItem.title = "Collection View"
			super.viewDidLoad()
			self.setupCollectionView()
		}

		private func setupCollectionView() {
			let flowLayout = UICollectionViewFlowLayout()
			flowLayout.scrollDirection = .vertical
			flowLayout.minimumInteritemSpacing = 0.0
			flowLayout.minimumLineSpacing = 0.0
			let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
			collectionView.alwaysBounceVertical = true
			collectionView.register(
				SectionHeaderView.self,
				forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
				withReuseIdentifier: SectionHeaderView.sectionHeaderId
			)
			collectionView.register(Section1.self, forCellWithReuseIdentifier: ViewController.section1)
			collectionView.register(Section2.self, forCellWithReuseIdentifier: ViewController.section2)
			self.view.addSubview(collectionView)
			self.collectionView = collectionView
			self.collectionView.translatesAutoresizingMaskIntoConstraints = false
			self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
			self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
			self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
			self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
			self.collectionView.dataSource = self
			self.collectionView.delegate = self
		}
	}

	// MARK: - UICollectionViewDelegateFlowLayout
	extension ViewController: UICollectionViewDelegateFlowLayout {
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
			switch indexPath.section {
			case 0:
				return CGSize(width: self.view.frame.width, height: 210.0)
			case 1:
				return CGSize(width: self.view.frame.width, height: 5 * 51.0 + 200.0) // How to enable self-sizing cells for table view inside
			default:
				fatalError("Unsupported section index.")
			}
		}

		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
			return CGSize(width: self.view.frame.width, height: 61)
		}
	}

	// MARK: - UICollectionViewDataSource
	extension ViewController: UICollectionViewDataSource {
		func numberOfSections(in collectionView: UICollectionView) -> Int {
			return 2
		}

		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			return 1
		}

		func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.sectionHeaderId, for: indexPath) as! SectionHeaderView
			switch indexPath.section {
			case 0:
				header.uiLabel.text = "Section 1"
			case 1:
				header.uiLabel.text = "Section 2"
			default:
				fatalError("Unsupported section index.")
			}
			return header
		}

		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			switch indexPath.section {
			case 0:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.section1, for: indexPath) as! Section1
				return cell
			case 1:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.section2, for: indexPath) as! Section2
				return cell
			default:
				fatalError("OverviewController: Unsupported section index.")
			}
		}
}

