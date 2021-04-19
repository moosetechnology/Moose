"
| browser |
browser := self new browser.
browser openOn: ( 
	MooseModel root allModels last allModelClasses ->
	(FAMIXClass new mooseDescriptionsOfNumberProperties collect: #implementingSelector )).
(browser pane port: #heightToSelect) value: #numberOfMethods.
(browser pane port: #widthToSelect) value: #numberOfAttributes.
(browser pane port: #colorToSelect) value: #numberOfLinesOfCode.
"
Class {
	#name : #MooseCustomizableSystemComplexityBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'instance creation' }
MooseCustomizableSystemComplexityBrowser class >> openOn: groupAndProperties heightToSelect: heightSelector widthToSelect: widthSelector colorToSelect: colorSelector [
	| browser window |
	browser := self new browser.
	window := browser openOn: groupAndProperties.
	(browser pane port: #heightToSelect) value: heightSelector.
	(browser pane port: #widthToSelect) value: widthSelector.
	(browser pane port: #colorToSelect) value: colorSelector.
	^ window
]

{ #category : #'instance creation' }
MooseCustomizableSystemComplexityBrowser class >> openOnClassGroup: classGroup heightToSelect: heightSelector widthToSelect: widthSelector colorToSelect: colorSelector [
	^ self 
		openOn: (classGroup -> (classGroup anyOne mooseDescriptionsOfNumberProperties collect: #implementingSelector))
		heightToSelect: heightSelector
		widthToSelect:  widthSelector
		colorToSelect: colorSelector
]

{ #category : #building }
MooseCustomizableSystemComplexityBrowser >> buildBrowser [
	browser := GLMTabulator withStatusbar.
	browser title: 'Customizable System Complexity'.
	browser
		row: #painting span: 3;
		row: [ :c | c column: #height; column: #width; column: #color ].
	browser transmit
		to: #painting;
		fromOutsidePort: #entity;
		from: #height;
		from: #width;
		from: #color;
		andShow: [ :a | self complexityIn: a ].
	browser transmit
		to: #height;
		andShow: [ :a | 
					a title: 'Height metric'.
					a list display: [ :group | group value ] ].
	browser transmit
		to: #width;
		andShow: [ :a | 
					a title: 'Width metric'.
					a list display: [ :group | group value ] ].
	browser transmit
		to: #color;
		andShow: [ :a | 
					a title: 'Color metric'.
					a list display: [ :group | group value ] ].
	browser transmit
		to: #height port: #selection;
		fromOutsidePort: #heightToSelect.
	browser transmit
		to: #width port: #selection;
		fromOutsidePort: #widthToSelect.
	browser transmit
		to: #color port: #selection;
		fromOutsidePort: #colorToSelect.
	^ browser
]

{ #category : #building }
MooseCustomizableSystemComplexityBrowser >> complexityIn: a [
	a roassal2
		initializeView: [ RTMondrian new ];
		painting: [ :view :group :height :width :color :presentation | 
			group key
				viewSimpleSystemComplexityWithSelection: OrderedCollection new
				height: [ :e | (height value: e) max: 5 ]
				width: [ :e | (width value: e) max: 5 ]
				color: color
				on: view ]
]
