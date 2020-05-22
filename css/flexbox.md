# Flexbox

## Resources

- [Codepen](https://codepen.io/pseigo/pen/KKdrxzy)
  - Alt: 'Flexbox Playground' on [Webmaker](https://webmaker.app/app/)
- [Spec: CSS Flexible Box Layout Module Level 1](https://www.w3.org/TR/css-flexbox-1/)
- [Spec: CSS Box Alignment Level 3](https://www.w3.org/TR/css-align-3/)
- [Article: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Mozilla: Flexbox](https://developer.mozilla.org/en-US/docs/Glossary/Flexbox)
  - _[Offline doc](https://devdocs.io/css/css_flexible_box_layout)_

## Flexbox default behaviour

- Items display in a row (the `flex-direction` property's default is `row`).
- The items start from the start edge of the main axis.
- The items do not stretch on the main dimension, but can shrink.
- The items will stretch to fill the size of the cross axis.
  - _`align-items: normal` which, for flex items, behaves as `stretch`_
- The `flex-basis` property is set to `auto`.
- The `flex-wrap` property is set to `nowrap`.

([Source](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox#The_flex_container))

## Terminology and main concepts

**The two axiis**: can align and justify content along each axis

- **Main axis**: primary axis along which flex items are laid out
  - `flex-direction: column | column-reverse` => vertical main axis
  - `flex-direction: row | row-reverse` => horizontal main axis
- **Cross axis**: perpendicular to main axis

Flexbox (and other CSS layouts like Grid) think about **start** and **end** for alignment rather than left and right.

### Available space

Available space, in the direction of the main axis, of a flex container `= (container space) - (space needed for elements)`.

### Flex container properties

- `flex-direction`
- `flex-wrap` (`nowrap` => overflow)
- `flex-flow` combines flow direction (`flex-direction`) and wrapping behaviour (`flex-wrap`)

### Flex item properties

- `flex-grow`
- `flex-shrink`
- [`flex-basis`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis) - takes priority over width/height; in direction of main axis
- [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) - combines flex-grow, -shrink and -basis. See docs for syntax

### Alignment

- `justify-content`: alignment of all items on main axis
  - There are lots of values (see [MDN docs](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content))
  - Works for both grid and flexbox containers
  - The safest values support-wise are `flex-start`, `flex-end`, and `center`
  - Adding `safe` ensures that elements cannot be pushed and rendered off-screen such that the content can’t be scrolled to (“data loss”)
- `align-items`: alignment of all items on cross axis
  - Sets `align-self` on all flex items
- `align-self`: alignment of an individual flex item on cross axis
  - Takes precedence over `align-items`
- `align-content`: controls space between flex lines on cross axis
  - `safe` and `unsafe` can be used here as well

> **Note**: The alignment properties in Flexbox have been placed into their own specification — [CSS Box Alignment Level 3](https://www.w3.org/TR/css-align-3/). It is expected that this spec will ultimately supersede the properties as defined in Flexbox Level One.
>
> [MDN - Properties that control alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Aligning_Items_in_a_Flex_Container#Properties_that_control_alignment)
