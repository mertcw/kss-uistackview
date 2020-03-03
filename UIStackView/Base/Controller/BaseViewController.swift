import UIKit

class BaseViewController: UIViewController {
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - View Lifecycle
	override func loadView() {
		super.loadView()
		view.backgroundColor = ColorPalette.primaryBackground
	}
}
