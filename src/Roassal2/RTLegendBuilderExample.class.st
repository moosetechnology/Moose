"
RTLegendBuilderExample new installTitle: 'OnDemand' 
		code:
		'
| l lb |
b := RTMondrian new.
b shape rectangle
	width: [ :c | c numberOfVariables * 5 ];
	height: #numberOfMethods.
b nodes: RTShape withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
b normalizer
	normalizeColor: #numberOfLinesOfCode using: { Color black. Color red }.
b build.

lb := RTLegendBuilder new.
lb onDemand.
lb view: b view.

lb addText: ''System complexity view''.
lb addRectanglePolymetricWidth: ''number of methods'' height: ''Line of code'' box: ''a Pharo class''.
lb build.

^ b view'
	
"
Class {
	#name : #RTLegendBuilderExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #sources }
RTLegendBuilderExample >> exampleBackgroundNPosition [

	|  lb b |
	b := RTMondrian new.
	b shape rectangle
		width: [ :c | c numberOfVariables * 5 ];
		height: #numberOfMethods.
	b nodes: RTShape withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	b normalizer
		normalizeColor: #numberOfLinesOfCode using: (Array with: Color black with: Color red ) using: [:vv | (vv + 1) ln * 5 ] .
	b build.

	lb := RTLegendBuilder new.
	lb view: b view.
	lb right.
	lb nestDo: [ :n :e :g | 
		n padding:10.
		n on: e nest: g.
		n resizeWithoutRecursion: e for: g ].
	lb backgroundShape box;
		borderColor: Color red;
		color: Color transparent;
		borderWidth: 2.
	lb backgroundShape shape borderStyle dash.
	lb addText: 'System complexity view'.
	lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code' box: 'a Pharo class'.
	lb addColorFadingFrom: Color black to: Color red text: 'number of lines of code'.
	lb build.

	^ b view
]

{ #category : #icons }
RTLegendBuilderExample >> exampleBackgroundNPositionIcon [
	^ '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
AElFTkSuQmCC'
]

{ #category : #sources }
RTLegendBuilderExample >> exampleBelow [

	|  lb b |
	b := RTMondrian new.
	b shape rectangle
		width: [ :c | c numberOfVariables * 5 ];
		height: #numberOfMethods.
	b nodes: RTShape withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	b normalizer
		normalizeColor: #numberOfLinesOfCode using: (Array with: Color black with: Color red ) using: [:vv | (vv + 1) ln * 5 ] .
	b build.

	lb := RTLegendBuilder new.
	lb view: b view.

	lb addText: 'System complexity view'.
	lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code' box: 'a Pharo class'.
	lb addColorFadingFrom: Color black to: Color red text: 'number of lines of code'.
	lb build.

	^ b view
]

{ #category : #icons }
RTLegendBuilderExample >> exampleBelowIcon [
	^ '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
6Bcj/wHPMRRbfIEHkQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTLegendBuilderExample >> exampleOnDemand [

	|  lb b |
	b := RTMondrian new.
	b shape rectangle
		width: [ :c | c numberOfVariables * 5 ];
		height: #numberOfMethods.
	b nodes: RTShape withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	b normalizer
		normalizeColor: #numberOfLinesOfCode using: (Array with: Color black with: Color red).
	b build.

	lb := RTLegendBuilder new.
	lb onDemand: '+Info'.
	lb view: b view.

	lb addText: 'System complexity view'.
	lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code' box: 'a Pharo class'.
	lb build.

	^ b view
]

{ #category : #icons }
RTLegendBuilderExample >> exampleOnDemandIcon [
	^ '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'
]

{ #category : #accessing }
RTLegendBuilderExample >> label [
	^ 'Legend'
]
