Class {
	#name : #RTSparklineExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Sparkline'
}

{ #category : #sources }
RTSparklineExample >> exampleLOC [
	| shape es v |
	shape := RTSparkline new.
	shape
		width: 80;
		height: 20.
	shape values: [ :cls | (cls rtmethods collect: #numberOfLinesOfCode) sorted ].
	es := shape elementsOn: RTShape withAllSubclasses.
	es @ RTDraggable @ RTPopup.
	v := RTView new.
	v addAll: es.
	RTGridLayout on: es.
	^ v
]

{ #category : #icons }
RTSparklineExample >> exampleLOCIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAE+UlEQVR4XuWaWUssMRCF5+f7
5oMg4oYg6rijgvu+466guCvuKKKIuFvjVHMjuX07mXSl2ztyDjTK6NQk83VyqiqdyeXwVUzK
4H8F+EDwhQ8EHwi+8IHgA8EXPhB8IPjCB4IPBF/4QPCFDwQfCL7wgeADwRc+EHwg+MIHgg8E
X/hA8IUPBB8IvvCB4APBFz4QfCD4wgeCDwRf+EDwhQ8EHwi+8IHgA8EXPpBE9PHxQb8SCGla
W1sTTUKPMT4+TtL3z8zM0ODgoHgM+s+3tzfymUdDQwP9CBA14NfX12Dy6iorKyPp5JWGhoYo
7sTVa9lslnwA6GpvbxePg1VZWUlSkLW1tcb3ZigkflHdhZeXlyT5QNv/dXZ2Utz357eW3MrK
CvkAUHGamppoZ2eH5ufnSTqPqakpknwfExMTNDk5aX1vZmlpSbTs1tfXg+A8ONPFf7dNzBZj
YWGBRkdHg9+Pjo5ix9jd3f1e2f39/cFlirGxsWGdS2Nj4/fvm5ubJInhsro5Bn6W9VtMne9s
Xt4+wdWSra6uTsz8VMzb21uRIU9PT3snJa4+WCgWrwgrEPWPvMSkW5k+8O3tbZqdnSXfgYf3
4pGREZKYetwbLOqzJVlmlLeZPDGjf+D7+3uuo6NDnArqrw0PD9PT05NXVsTp8cDAwD/78fn5
eSxDzq+mnOvKMBn64eFh4Fe+2R2L52TcstQkObNiI5SaOmcuNTU1lB84JZEYtLW1kW+M7u5u
a0IQZcicfZ2dnVF5eTn19vaSa61iMvWxsTFaXFx0joFv6oitE05huRiKs3q0nD+4rq6uglTY
taBLS2pLY2+UJgjhWBcXF5QqEH0vdynoTDFaWloKFppxxdsYbyV3d3eiSv3l5SXwR0kfLOwt
Nzc3QZHJW2SiQKLMlBOEqqoq5/Q0PNi9vT0vGFEZWnNzszFeuE3EF5sv/+Q2ycPDQ2JtG5un
ZGyVtum6v78n3UxXV1eDLUn93TW7UjHYeCsqKv76jOPj41gxCnUN+vr6jPF4FedvIK+VWKhS
1y/uQCRi6q5fEr5SNHVpuzwNT6qrqyM4IFF+8NNAosaAAOO7UrdVla2trfS/IKDBiDR1zipU
29uW2rGZShICPTFgTzo4OKDS0tKgPW7630Km7jMOTn/ZTIslBn6ljlKpq/Nv7uUkEYvrGelZ
uorBXWKfGFE1hnQ71bfo+vr6dCp1/UN8zlLCfsJNPklhpuQLwuZv0sJX6fPzM9kVEh4sF0d8
DuIbh++8ubk5Oj09FZ/rS0CYzmAM1b0Ioi4+Hk6kUud2++PjI21tbQVBS0pKrNWwqdBUps5f
nN5kc5XeMeDWeb4/FHQNTA9T+FbZ6rzfJ0ZPTw+dnJyQd6WOryIxdX352U67khZvfXx+/acF
Ty6P36QRw6Tl5WXnrrEXEFuxaKvauZuqzi+0K/aAudPL25/LHmzS/v6+dwybt3DI6+trSqVS
dzUgPgcIv8bnC5zaPj8/O8cxTZhb9nH2/jRimIw97ANpHZQVNPWurq7ITIdP//ihMZ+7Tzdk
fppD8mhPEjGUIdse2vv1hSG+8IHgA8EXPhB8IPjCB4IPBF/4QPCFDwQfCL7wgeADwRc+EHwg
+MIHgg8EX/hA8IUPBB8IvvCB4APBFz4QfCD4wgeCDwRf+EDwhQ8EHwi+8IHgA8EXPhB8IPjC
B4IPBF/4QPCFD6So9QWkXF11duLGUQAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTSparklineExample >> label [
	^ 'Sparkline'
]
