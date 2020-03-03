import UIKit

final class CrossAxisAlignmentViewController: BasePageViewController {
	override var contentList: [Content] {
		return [
			.textContent(.body("The third most important property of UIStackView is alignment. Its value affects the positioning and sizing of arranged subviews along the cross axis. That is, the Y axis for horizontal stacks, and X axis for vertical stacks. You can set it to one of the following values for both vertical and horizontal stacks:\n\n\t⦁ fill (default): The stack view ensures that the arranged views fill all the available space on the cross axis.\n\t⦁ leading/trailing: All subviews are aligned to the leading or trailing edge of the stack view along the cross axis. For horizontal stacks, these correspond to the top edge and bottom edge respectively. For vertical stacks, the language direction will affect the outcome: in left-to-right languages the leading edge will correspond to the left, while the trailing one will correspond to the right. The reverse is true for right-to-left languages.\n\t⦁ center: The arranged subviews are centered along the cross axis.\n\nFor horizontal stacks, four additional options are available, two of which are redundant:\n\n\t⦁ top: Behaves exactly like leading.\n\t⦁ firstBaseline: Behaves like top, but uses the first baseline of the subviews instead of their top anchor.\n\t⦁ bottom: Behaves exactly like trailing.\n\t⦁ lastBaseline: Behaves like bottom, but uses the last baseline of the subviews instead of their bottom anchor.")),
			.spacing(20.0),
			.note("Using firstBaseline and lastBaseline on vertical stacks produces unexpected results. This is a clear shortcoming of the API and a direct result of introducing orientation-specific values to an otherwise orientation-agnostic property."),
			.spacing(20.0),
		]
	}
	
	override func loadView() {
		super.loadView()
		title = "Alignment"
	}
}
