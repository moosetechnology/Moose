"
RTNameCloudExample new installTitle: 'SimpleExample' 
		code:
		'
| b |
b := RTNameCloud new 
		addString: ''open

		| v shape |
		v := RTView new.
		shape := RTLabel new height: [ :assoc | assoc value ]; text: #key.
		v addAll: (shape elementsOn: table associations).
		RTFlowLayout on: v elements.
		v open''.
b open.
b  view canvas.
		'
	
"
Class {
	#name : #RTNameCloudExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-NameCloud'
}

{ #category : #sources }
RTNameCloudExample >> exampleRoassalCode [
	<gtExample> 
	<noTest>
	| b |
	(TRPlatform current dialogConfirm: 'This example takes a long time to load, execute?')
	ifFalse: [ ^ self ].
	b := RTNameCloud new.
	RTObject withAllSubclasses do: [ :c | 
		b addStrings: (c rtmethods collect: #sourceCode) ].
	^ b
]

{ #category : #icons }
RTNameCloudExample >> exampleRoassalCodeIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAN0UlEQVR4XuXdR5OVRRcHcFau
/AhsdenGD+CGhWursCwWVAliuUDLUimlFDGUAUUxR8wZVMSEOeesYMacFXNG7fH9db1n6tzH
ZxiBmXEu3VVT994Op/vpc+/5n9Q9M0ZG2i/TqcxofwvaZ0j7pX2GtM+Q9sswM+TSSy8tW9P/
q6++2mL/a665ptx4443l66+/Ln/++We56KKLyuuvv15++umn8sUXXwyM/eyzz8qHH344Wvf+
++//o9+mTZuKskMx5Nlnnx19IBv00ksvjX5eunTpyHHHHVfefPPN0bply5aVBx54YGATVq9e
XdS/9dZb5brrritXXHFF+eCDD8qaNWv+MdbrMcccUx588MGyfPny+vnkk08eoHfffffVz88/
/3yxBv0x6JZbbhnot2jRovLyyy/vWAzZZZdd6gOdccYZ5YQTTii+iZkhyqGHHjpa9+6775Zr
r712YBN8VjDk3nvvLZ9//nnZfffdK73c77XXXqub+tBDD5UNGzZgysixxx5bfyW539tvv13u
ueee4hf6xx9/VLrnnHPOP/qh88wzzwwXQ2xC/vzjjz+WLFqCITY//zqi7vrrry+XXHJJaR9D
JqDsuuuu9Vu2//77l/gmH3jggeX0008vBx10UMkM2WOPPUYOOOCA8v3335f2IXySGLLbbruV
q666anSDZ8yYUb777rv6t9NOO5XxfiHtl0kQWUTOzjvvXP7PkJGnnnqqxF/7DJlihpx99tl1
g2fPnl1+/fXXMmfOnHLHHXfUuieffLK+zpw5s32GTBVDQm3MairVVl3o81RONgGNh2rZ/ta3
b6m3z5D2S/sMaZ8h7Zf2GVLLO++8s02KAXfLDs8QLo+bb7652hy///57WbVqVbn66qvLRx99
VH1Ja9eurR7V5557bnQzos04423UI488UvtwHG7cuLHSOPjgg2vdl19+OTpW28qVKwuvLsag
xXXDP8YfFf1eeeWVwlMbn/XnIdi8eXN59dVXC2flJ598UrLjE41vv/223HDDDXXdUU99nwpm
bjdDPLCNtLH77rtvefTRR0ts2rp168oLL7xQ2zjx8rhou/jii0fH20Aby3XOtqE6c0Y+/PDD
VV2Octddd5UFCxZUtZq75vbbb69eYJ7dxx9/fHSeO++8c8BRaB6v1O9ffvmlOiitn2Mx+tx9
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'
]

{ #category : #sources }
RTNameCloudExample >> exampleSimpleExample [

| b |
b := RTNameCloud new 
		addString: 'open

		| v shape |
		v := RTView new.
		shape := RTLabel new height: [ :assoc | assoc value ]; text: #key.
		v addAll: (shape elementsOn: table associations).
		RTFlowLayout on: v elements.
		v open'.
	^ b
]

{ #category : #icons }
RTNameCloudExample >> exampleSimpleExampleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADF0lEQVR4XuXYXUsiYRyHYQ/6
VB127nF0KkFR9AGKTCgLLYoIEix7sUwUCsSEXgQ9SE0lRLAgyI466qCz6PDn7v8hZdtdFvYN
3L1vkGJmmpznmhnHx9Pp8OunPPwh4IPw44PwQfjxQfgg/PggfBB+fBA+CD8+CD8+CB+EHx+E
D8KPD8IH4ccH4YPw44Pw44PwQfjxQfgg/PggfBB+fBA+CD8+CD8+CB+EHx+ED8KPD8IH4ccH
4YPw44Pw44PwQfjxQfgg/P5lkNfXV/XDwR8eHqparapcLisajSoSiWhhYUHxeFwXFxdqtVq9
97m1tSV75fN59/Pk5ETtdlv/BYgd0K/8XSAQUDKZ1Pj4uGKxmFZWVrS4uKipqakP+5ufn9fe
3p4qlYrGxsZ0fHysmZkZzc3NOQD+FfLexMSE0um0O8N2dnY0Ojqqu7s7XV5eygbx84B37Myb
nJyU3+9XoVBQNpvtDWAwGNTp6amGh4eVy+VseyUSCd3c3HwYZFt2e3vr0Gyb8/Nzzc7OurPf
lvNB3nt5edHIyIi6V4jP53MYu7u7DsNelg340NCQQqGQrq6uvhnArwH4nyE/aHp6Ws/Pz27A
9vf33RncXRcOh7W6uto7ozOZjBtwu38Xi0UHsra2plqtpnq97u7p9/f34n+o/0aPj4/u9mC/
Dw4O/tRg2m2M/5T1FxoYGHAD6/V6xX+Q7QMQe5pZX193H8D8Ie4DkLe3N3k8/O+c/G/qfBB+
fBA+CD8+CB/kz/W9WVH7Rm6PwV/Ojm5ubn54LH54eND19bWbPEylUnp6euqtOzo60vLysmyb
UqnUW96drbX/Zfu3CcXuOlu+sbGhZrPZW7a0tKSDgwOdnZ252QCbmLT5su3tbbfv7nY222v7
sxnf7rJGo+H2Z+/ZjstmFPhXCP8K4ccH4YPw44Pw44PwQfjxQfgg/PggfBB+fBA+CD8+CD8+
CB+EHx+ED8KPD8IH4ccH4YPw44Pw44PwQfjxQfgg/PggfBB+fBA+CD8+CD8+CB+EHx+ED8KP
D8IH4ccH4YPw44Pw44P0c58A+fULRMou/rUAAAAASUVORK5CYII='
]

{ #category : #accessing }
RTNameCloudExample >> label [
	^ 'Name cloud'
]
