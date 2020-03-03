import UIKit

private typealias Content = BasePageViewController.Content

final class ReferencesViewController: BasePageViewController {
	override var contentList: [Content] {
		return [
			.textContent(.headline("Apple UIStackView Documentation")),
			.textContent(.body("https://developer.apple.com/documentation/uikit/uistackview")),
			.spacing(30.0),
			.textContent(.headline("NSHipster UIStackView Blog Post")),
			.textContent(.body("https://nshipster.com/uistackview/")),
		]
	}
	
	override func loadView() {
		super.loadView()
		title = "References"
	}
}
