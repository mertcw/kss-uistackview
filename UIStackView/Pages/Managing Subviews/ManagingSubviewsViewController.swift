import UIKit

private typealias Content = BasePageViewController.Content

final class ManagingSubviewsViewController: BasePageViewController {
	override var contentList: [Content] {
		return [
			.textContent(.body("In iOS, the subviews managed by the stack view are referred to as the arranged subviews. You can initialize a stack view with an array of arranged subviews, or add them one by one after the fact.")),
			.image("ms_code_block_01"),
			.note("Stack views don't have an intrinsic content size, so you must set it either implicitly with Auto Layout constraints or explicitly via its intrinsicContentSize property. When nested in a scroll view, constraints between the stack view and the view containing the scroll view are necessary for things to work as expected."),
			.spacing(40.0),
			.textContent(.body("Adding an arranged view using any of the methods above also makes it a subview of the stack view. To remove an arranged subview that you no longer want around, you need to call removeFromSuperview() on it. The stack view will automatically remove it from the arranged subview list. In contrast, calling removeArrangedSubview(_ view: UIView) on the stack view will only remove the view passed as a parameter from the arranged subview list, without removing it from the subview hierarchy. Keep this distinction in mind if you are modifying the stack view content during runtime.")),
			.image("ms_code_block_02"),
			.textContent(.headline("Toggling Subview Visibility")),
			.spacing(10.0),
			.textContent(.body("One major benefit of using stack views over custom layouts is their built-in support for toggling subview visibility without causing layout ambiguity; whenever the isHidden property is toggled for one of the arranged subviews, the layout is recalculated, with the possibility to animate the changes inside an animation block:")),
			.image("ms_code_block_03"),
			
		]
	}
	
	override func loadView() {
		super.loadView()
		title = "Managing Subviews"
	}
}
