import UIKit

private typealias Content = BasePageViewController.Content

final class OverviewViewController: BasePageViewController {
	override var contentList: [Content] {
		return [
			.textContent(.title2("Class")),
			.spacing(20.0),
			.textContent(.largeTitle("UIStackView")),
			.spacing(30.0),
			.textContent(.title3("A streamlined interface for laying out a collection of views in either a column or a row.")),
			.spacing(40.0),
			.line(1.0),
			.spacing(40.0),
			.textContent(.title1("Declaration")),
			.spacing(20.0),
			.image("overview_code_block_01"),
			.spacing(50.0),
			.textContent(.title1("Overview")),
			.spacing(20.0),
			.textContent(.body("Stack views let you leverage the power of Auto Layout, creating user interfaces that can dynamically adapt to the device’s orientation, screen size, and any changes in the available space. The stack view manages the layout of all the views in its arrangedSubviews property. These views are arranged along the stack view’s axis, based on their order in the arrangedSubviews array. The exact layout varies depending on the stack view’s axis, distribution, alignment, spacing, and other properties.")),
			.spacing(40.0),
			.image("overview_01"),
			.spacing(40.0),
			.textContent(.body("To use a stack view, open the Storyboard you wish to edit. Drag either a Horizontal Stack View or a Vertical Stack View out from the Object library, and position the stack view where desired. Next, drag out the stack’s content, dropping the view or control into the stack. You can continue to add views and controls to your stack, as needed. Interface Builder resizes the stack based on its content. You can also adjust the appearance of the stack’s content by modifying the Stack View’s properties in the Attributes inspector.")),
			.spacing(30.0),
			.note("You are responsible for defining the position and (optionally) the size of the stack view. The stack view then manages the layout and size of its content.")
		]
	}
	
	override func loadView() {
		super.loadView()
		title = "Overview"
	}
}
