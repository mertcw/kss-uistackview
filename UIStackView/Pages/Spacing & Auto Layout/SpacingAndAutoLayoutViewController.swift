import UIKit

final class SpacingAndAutoLayoutViewController: BasePageViewController {
	override var contentList: [Content] {
		return [
			.textContent(.body("By default, a stack view sets the spacing between its arranged subviews to zero. The value of the spacing property is treated as an exact value for distributions that attempt to fill the available space (fill, fillEqually, fillProportionally), and as a minimum value otherwise (equalSpacing, equalCentering). With fill distributions, negative spacing values cause the subviews to overlap and the last subview to stretch, filling the freed up space. Negative spacing values have no effect on equal centering or spacing distributions.")),
			.spacing(20.0),
			.image("sal_code_block_01"),
		]
	}
	
	override func loadView() {
		super.loadView()
		title = "Spacing & Auto Layout"
	}
}
