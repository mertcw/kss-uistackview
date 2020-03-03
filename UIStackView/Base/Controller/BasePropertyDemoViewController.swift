import UIKit
import SnapKit

class BasePropertyDemoViewController: BaseDemoViewController {
	lazy var propertyStackView: DemoPropertyStackView = {
		let stackView = DemoPropertyStackView(titles: propertyTitles())
		stackView.delegate = self
		return stackView
	}()
	
	// MARK: - View Lifecycle
	override func loadView() {
		super.loadView()
		
		propertyStackView.snp.makeConstraints { make in
			make.height.equalTo(64.0)
		}
		
		stackView.addArrangedSubview(propertyStackView)
	}
	
	func selectProperty(atIndex index: Int) {
		propertyStackView.selectButton(atIndex: index)
	}
}

// MARK: -
extension BasePropertyDemoViewController {
	@objc func propertyTitles() -> [String] { [] }
}

// MARK: - DemoPropertyStackViewDelegate
extension BasePropertyDemoViewController: DemoPropertyStackViewDelegate {
	func propertyStackView(
		propertyStackView: DemoPropertyStackView,
		didReceiveTapAt index: Int) { }
}
