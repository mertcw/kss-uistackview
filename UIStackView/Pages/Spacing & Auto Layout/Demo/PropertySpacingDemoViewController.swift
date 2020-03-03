import UIKit

class PropertySpacingDemoViewController: BasePropertyDemoViewController {
	private lazy var spacingsList: [CGFloat] = {
		return [-128.0, -32.0, 0.0, 8.0, 32.0, 128.0]
	}()
	
	override func propertyTitles() -> [String] {
		return ["-128.0", "-32.0", "0.0", "32.0", "128.0", "32.0 Inset Toggle"]
	}
	
	override var numberOfInitialItems: Int { return 7 }
	
	override func propertyStackView(
		propertyStackView: DemoPropertyStackView,
		didReceiveTapAt index: Int) {
		
		if propertyTitles()[index] == "32.0 Inset Toggle" {
			let layoutMargins: UIEdgeInsets = {
				if demoStackView.layoutMargins.top == 32.0 {
					return UIEdgeInsets.zero
				} else {
					return UIEdgeInsets(top: 32.0, left: 32.0, bottom: 32.0, right: 32.0)
				}
			}()
			
			// NOT ANIMATABLE
			demoStackView.layoutMargins = layoutMargins
			
			return
		}
		
		UIView.animate(withDuration: 0.33) {
			self.demoStackView.spacing = self.spacingsList[index]
		}
	}
	
	override func loadView() {
		super.loadView()
		title = "Spacing"
		demoStackView.axis = .vertical
		selectProperty(atIndex: 2)
		
		demoStackView.isLayoutMarginsRelativeArrangement = true
	}
}
