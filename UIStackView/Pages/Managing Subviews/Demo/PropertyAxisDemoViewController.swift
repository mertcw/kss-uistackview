import UIKit

class PropertyAxisDemoViewController: BasePropertyDemoViewController {
	private lazy var axisList: [NSLayoutConstraint.Axis] = {
		return [.vertical, .horizontal]
	}()
	
	override func propertyTitles() -> [String] {
		return ["Vertical", "Horizontal"]
	}
	
	override var numberOfInitialItems: Int { return 7 }
	
	override func propertyStackView(
		propertyStackView: DemoPropertyStackView,
		didReceiveTapAt index: Int) {
		UIView.animate(withDuration: 0.33) {
			self.demoStackView.axis = self.axisList[index]
		}
	}
	
	override func loadView() {
		super.loadView()
		title = "Axis"
		demoStackView.axis = .vertical
		selectProperty(atIndex: 0)
	}
}
