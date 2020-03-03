import UIKit

final class BaseNavigationController: UINavigationController {
	override func loadView() {
		super.loadView()
		navigationBar.barTintColor = ColorPalette.navigationBackground
		navigationBar.tintColor = UIColor.white
		navigationBar.titleTextAttributes = [
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
		navigationBar.isTranslucent = false
	}
	
	override var prefersStatusBarHidden: Bool { return true }
}
