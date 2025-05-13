---
alias: reducer
---

In programming this function takes a bunch of values and reduces them into one.
The following javascript function iterates over an array of `item` objects with `quantity` property and sums the values:
```js
const calculateTotal = () =\> {
const totalCount = items.reduce((total, item) =\> {
	return total + item.quantity;
}, 0);
setTotalItemCount(totalCount);
};
```