# Flexbox

## Resources

- [Codepen](https://codepen.io/pseigo/pen/KKdrxzy)
  - Alt: 'Flexbox Playground' on [Webmaker](https://webmaker.app/app/)
- [Flexbox Spec](https://www.w3.org/TR/css-flexbox-1/)
- [Article: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Mozilla: Flexbox](https://developer.mozilla.org/en-US/docs/Glossary/Flexbox)
  - _[Offline doc](https://devdocs.io/css/css_flexible_box_layout)_

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
-

### Flex item properties

- `flex-grow`
- `flex-shrink`
- [`flex-basis`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis) - takes priority over width/height; in direction of main axis
- [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) - combines flex-grow, -shrink and -basis. See docs for syntax
