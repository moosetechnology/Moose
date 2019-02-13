"
RTLineDecorationExample new installTitle: 'Cool' 
		code:
		'
	| v b1 b2 edges |
	b1 := (RTBox new
		size: 100;
		element)
		translateTo: 0 @ 0;
		@ RTDraggable.
	b2 := (RTBox new
		size: 100;
		element)
		translateTo: 400 @ 0;
		@ RTDraggable.
	edges := OrderedCollection new.
	edges add: ((RTArrowedLine new head: RTFilledDiamond asHead; color: Color black; width: 2; attachPoint: (RTRectangleAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new color: Color blue; width: 2; attachPoint: (RTRectangleAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; color: Color green; width: 2; attachPoint: (RTRectangleAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; emptyCircleTail; color: Color red; width: 2; attachPoint: (RTRectangleAttachPoint new offset: 15)) edgeFrom: b1 to: b2).


v := RTView new
	add: b1;
	add: b2;
	addAll: edges.
edges do: [ :each | each update ].
v
'
	
"
Class {
	#name : #RTLineDecorationExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTLineDecorationExample >> exampleCool [

	| v b1 b2 edges |
	b1 := (RTBox new
		size: 100;
		element)
		translateTo: 0 @ 0;
		@ RTDraggable.
	b2 := (RTBox new
		size: 100;
		element)
		translateTo: 400 @ 0;
		@ RTDraggable.
	edges := OrderedCollection new.
	edges add: ((RTArrowedLine new head: RTFilledDiamond asHead; color: Color black; width: 2; attachPoint: (RTBorderAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new color: Color blue; width: 2; attachPoint: (RTBorderAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; color: Color green; width: 2; attachPoint: (RTBorderAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; emptyCircleTail; color: Color red; width: 2; attachPoint: (RTBorderAttachPoint new offset: 15)) edgeFrom: b1 to: b2).


v := RTView new
	add: b1;
	add: b2;
	addAll: edges.
edges do: [ :each | each update ].
^ v

]

{ #category : #icons }
RTLineDecorationExample >> exampleCoolIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAByElEQVR4XuXau43CQBSGURdC
BdCZG4BgBSEZJUACvZgCCHmInBL4vQObbbDBConB5xtNAz72cEei6Xu/mmr8R+CD+PkgPoif
D+KD+PkgPoifD+KD+Pkgfj6ID+Lng/ggfj6ID+Lng/ggfj6Inw/ig/j5ID6Inw/ig/j5ID6I
nw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SCVg5zP5/6VW+t0OuWVz88H8UGG0e12iw9SQdfr
NaPRKE3T9Ov1OtWDLJfLDHm3bfvEeOzJZJLD4eB/Ie9uv99nNpv5R5b/o/6PvVj01D4e/S+k
jikr/pRVx5SVMmWV1ZS1Kav+I2vgq02ZsvqfNc44h4s/Zb29Ll2+bu1nHFlZrZLdLrnfM0SM
lIthuRmmXEaSzQccWdlunxCZzzPEsarcDFNuhf1jZzzOpfaL4ePLeLxFQz6y0nXJdOpPWf7F
0AfxQXwQH8QH8UH+AMmL00Be/fz8f51Ulg/ig/j5ID6Inw/ig/j5ID6Inw/ig/j5IH4+iA/i
54P4IH4+iA/i54P4IH4+iJ8P4oP4+SA+iJ8P4oP4+SA+iJ8P4ueD+CB+PogP4ueD+CB+PogP
4ueD+P3uG69wVbQ1PZxEAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTLineDecorationExample >> exampleCoolWithJump [
	| v b1 b2 edges |
	b1 := (RTBox new
		size: 150;
		element)
		translateTo: 0 @ 0;
		@ RTDraggable.
	b2 := (RTBox new
		size: 150;
		element)
		translateTo: 400 @ 0;
		@ RTDraggable.
	edges := OrderedCollection new.
	edges add: ((RTArrowedLine new head: RTFilledDiamond asHead; color: Color black; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new color: Color blue; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; color: Color green; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; emptyCircleTail; color: Color red; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	v := RTView new
		add: b1;
		add: b2;
		addAll: edges.
	edges do: [ :each | each update ].
	^ v
]

{ #category : #icons }
RTLineDecorationExample >> exampleCoolWithJumpIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAByElEQVR4XuXbsXHCMBiGYQ/C
BLAZWYAiByUlG0ADu8AAlOA7eo/A58jJCgFsPa9OC/ixhf6Cpu/9xlTjPwIfxM8H8UH8fBAf
xM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQ
Px/EB/HzQXwQPx+kXpC2bftX71q63+959bPyQXwQH8QH8UF8EB/EB/FBfJAP1XVdfJAR9Hg8
MpvN0jRNv9/vUw3IdrvNFPdyufzFGPZiscj1evW/kE93uVyyWq38I8v/UX/h3mz6Kvbt5n8h
47hlxb9ljeOWlXLLKqsp61BWPUfWRNcy5ZbV/6155rm2/i3r451zznf3VdeRld0uOZ2S5zNT
wkgZDMtkmDKMJIeKjqwcj78QWa8zpWtVmQxTpsJ+2JnP09YyGA5fxvC2TfHIyvmc+IOhPxj6
ID6ID+KD+CA+iA/ig/ggPogP4oP4ICpI3lAtIO94Vv7/Q0aWD+KD+PkgPoifD+KD+PkgPoif
D+KD+Pkgfj6ID+Lng/ggfj6ID+Lng/ggfj6Inw/ig/j5ID6Inw/ig/j5ID6Inw/i54P4IH4+
iA/i94/9AObDevK8Tn8bAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTLineDecorationExample >> exampleStyledMultiLineHeads [
|view addHead heads offset|
view := RTView new.
addHead := [ :aHeadName :anOffset |
	| e1 e2 l1 |
	e1 := RTBox new element.
	e2 := RTBox new element.
	l1 := RTStyledMultiLine new
		color: Color black;
		perform: aHeadName asSymbol;
		edgeFrom: e1 to: e2.
	l1 model: aHeadName.
	view addAll: (Array with: e1 with: e2 with: l1).

	e1 translateBy: -110 @ anOffset.
	e2 translateBy: 110 @ anOffset.

	l1 @ (RTLabeled new color: Color black) ].

heads := (RTStyledMultiLine rtmethods collect: [ :m | m selector ]) select: [ :m | m endsWith: 'Head' ].
offset := 0.
heads	do: [ :id | 
		addHead value: id value: offset.
		offset := offset + 40 ].

^ view

]

{ #category : #sources }
RTLineDecorationExample >> exampleStyledMultiLineHeadsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGEAAABCCAAAAABiVefnAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQffCAMOAQeAmGmdAAAEs0lEQVRYw+1YXWhbVRw/aVrwRSg4YeCgsAfZg/UDnxVBnwQFEZE9jIHIcJtuSqcjw1qpi42OpEljtV2lrevarluXzZXaD1aossHK2lHaabRN2jQftZqEpWmaNLn33L/39n7k3pN7czNvJir9PyX3/M7/d875f56D4EELIj8wWHcOpnUhDM1oMpTEIVOgKSIE8ToFoWkYGKKAUZmPaQFDgeMiFIfkYMB9T4SwDLmsbHGQutB0E1NZYj1bst/wInphGOMtJYTJ5DkpaDp3umMNtj8hBpLT3/0wOiLKxI2+t14ZTIJijZmfe6+NCYDhn55FFabas1ElA+W/NDguQiaPxODWSWsYCwxTZz3fXxVlaOLyO8+d21AypOc7L14TAJ7xZ5AZ7bZHledE+c73SpDRQ1Hw1n0YwvwpZdMK5Mjp4TSVIRa4mVdHw0uotjuF00oITuUdhAKb53O7D7Zn8b6EJVNDX29K3YxYsvQnrTk9S3dZQzJLExYrxRVL8VYs91bFZKw7Gd/XEpAe1rDsMPxLGfQzcymC8+FXuAd9by1JNL01N7gFhikwXJ+TDoNkYB45YnwXbGLZ7xcpSAa6Bn1gmIIGx/RHvwgUPAMjClB7EHpf7ZwYpagplgYpsK7Fj3sBCwybsWR+At6DqtB760nl3GxsnfCxdDxBrDueyOX3YAtC5NhsSqxAPza43Ly0uF3VyFSFLBmixt2x2r9y56WltaF/jTj7BUdTaws/7Gp/Mw6w+LpPrKILt/zLvCwFfLtRJaq9QVbRpanfAkvLkiwFZubIKhq6fXdFgPiillUAR1tUqHGKQ2VPCT0VJONOpcEp+CT7z3YCQbB18lqQwkQYqBr0dBBUOiZG39TSWA5sfzR3CVoK4uHRfWHDmYOCL4/3acVD9uCi8dREg/0bzZguqaksRSQtBQy4zAT/zwq0wyCKrGdTqaJYtzwwNF3U4zgF2t7KaWeKU3DDxaKGhkyvl+hbGVlmmunoCauUIDkk0tEe1ISw/bvv1PnGAbEZIHIrhrH62esnQsR8+Yox+Pci9Ng8mR7zfy9ZloHq+vR3Ibdy9eH2SigY4iQYWbRsAkw15sj6MO0P85BQIHEAVVWhV1PEHSg08ysLCYYXHN05YO10p96zJta4yfpmFy/Orz+2QBoSJzbIGvfZmRYnj2lufxxVVqIn4wTDgt3qdrqa2w4dZmsAsBcZz8sB4Q60GVuXgRtnAbo7iVPKxhJSwqXhDDKb0UkigdHxezneUybr5jljO21/JnChpTGsnGr7wqmSv2W1Z+vdXbveTmmZGsNqfQ/crRsG9VsWO3/Or9P1MbAaKQJhF95fx97jaK17HKPbunKeVQzCbSMj+ZZK1iih49MJSVY7ftD3ONkK/rO5dYfBIAMuUzejxbCdpUt4FfnbDGzO7X/NC3RZtyF7X6JpSB42oepvdUP2fhnENzIGbj6BzJUm9EaEfAAzxMC987VfvnrlimfoaAUym5DJjKo7NoxfquUM0z0jY6OjIxMND3MMFWa090KyjAz591YGvM+zp4RMx9bJx1SDDOKbMWvpbMNDqGaoXE8bMgZR2FZn/OhqmQNCJeLKHNQFWaPMEf1PZL6/AAR+8n9Npcr0AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE1LTA4LTAzVDE2OjAwOjMwKzAyOjAwCPXwuwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxNS0wOC0wM1QxNjowMDozMCswMjowMHmoSAcAAAAASUVORK5CYII='
]

{ #category : #sources }
RTLineDecorationExample >> exampleStyledMultiLineStyles [
|view addStyle styles|
view := RTView new.

addStyle := [ :aStyleName |
	| e1 e2 l1 |
	e1 := RTBox new element.
	e2 := RTBox new element.
	l1 := RTStyledMultiLine new
		color: Color black;
		perform: aStyleName asSymbol;
		edgeFrom: e1 to: e2.
	l1 model: aStyleName.
	view addAll: (Array with: e1 with: e2 with: l1).

	l1 @ (RTLabeled new color: Color black).
].

styles := (RTStyledMultiLine rtmethods collect: [ :m | m selector ]) select: [ :m | m endsWith: 'Line' ].
styles do: [ :id | addStyle value: id ].

RTGridLayout new
	gapSize: 50;
	lineItemsCount: 2; on: view elements.

view elements pairsDo: [ :a :b | b translateBy: 100 @ 0 ].

^ view
]

{ #category : #sources }
RTLineDecorationExample >> exampleStyledMultiLineStylesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAHQAAAAsCAIAAAA7JQvqAAAAA3NCSVQICAjb4U/gAAABxklEQVRoQ+2ZUYqFMAxFpzr/4hZ0/1vSHSguQJ0MHYokNR1o87B435c0Nsk7vZRcdOd5fuFnQ6CxSYusvwQA11AHgAu4hgQMU0O5hnC/We51XbdtC4td1/V9b1i/5tRJVlCu4fFy5fpSNPwOw8DKhon4OI62be+itO6ce0h03/em+ROQ7CozmjyWOFzqY55n2hy9Fqhd3Xq8LXpHGdfCHZkC605XWYEKL04B5RoePuACriEBw9RQriFcPoolXYdhL7WlTrKCcg2PlCvXl1IcmrdnfoDTrRo5kTDnSXd0DZV9LfguWfQayn9tWRb9ZOJwFYd2tWe6VbtO0Mo0Xe9rdC3ocHEt6HyyonBoWfj0zVCuzicrCrhZ+PTNgKvzyYoCbhY+fTMfxZKuQ0/3qmiSFZRrqAeuXF8q6tAMu6g89TRN0g3Sf4rDVRxa5RxKts+uBZka14JkUmwFDq0YSpkIypVMiq0AbjGUMhHgSibFVgC3GEqZiI9iSdchU7x2JckKyjXURhzu1aF570Gfy/7/QP0Gx/LhB+rTV//Agz+WcRzvPmLxOTcpdcODri11klVcubX9zYf2y5X70DbrbAvKNTw3wDWE+wOKyj7o41vluQAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTLineDecorationExample >> label [
	^ 'Line decoration'
]
