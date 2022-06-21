# Hotdog stand script

This script is designed for QB Core. If you have any suggestions/improvement suggestions make an issue and I'll get to it when I have time/see it.

## Installation

For implementing the items into the available items, copy/paste the following lines into your shared.lua in qb-inventory.

---

__shared.lua__

```lua
['hotdog'] = {['name'] = 'hotdog', ['label'] = 'Hotdog', ['weight'] = 200, ['type'] = 'item', ['image'] = 'hotdog.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Awesome hotdog'},

['hotdog_bread'] = {['name'] = 'hotdog_bread', ['label'] = 'Hotdog bread', ['weight'] = 80,	['type'] = 'item', ['image'] = 'hotdog_bread.jpg', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Finest hotdog bread on the marked'},

['hotdog_sausage'] = {['name'] = 'hotdog_sausage', ['label'] = 'Hotdog sausage', ['weight'] = 120, ['type'] = 'item', ['image'] = 'hotdog_sausage.jpg', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false,	['combinable'] = nil, ['description'] = 'Most juicy sausage for the perfect hotdog'},
```

Afterwards, copy/paste the images attached from the /img folder into the images folder for qb-inventory. The current images are just for demo purposes, so feel free to find your own and implement those.

## Dependencies

-   qb-core
-   qb-target
-   qb-inventory


