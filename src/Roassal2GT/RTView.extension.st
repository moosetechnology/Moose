Extension { #name : #RTView }

{ #category : #'*Roassal2GT-Inspector' }
RTView class >> gtExampleEmptyView [
	<gtExample>
	<label: 'Empty view'>
	
	^ self new
]

{ #category : #'*Roassal2GT-Inspector' }
RTView >> gtInspectorElementsHierarchyIn: composite [
	<gtInspectorPresentationOrder: 20>
	composite table 
		title: 'Elements';
		showOnly: 50;
		display: [ :each | each elements ];
		children: #nestedElements;
		column: 'Model' evaluated: [ :each | each model asString ];
		column: 'Shape' evaluated: [ :each | each shape asString ]
]

{ #category : #'*Roassal2GT-Inspector' }
RTView >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal2
		title: 'View';
		initializeView: [ self ]
		
]

{ #category : #'*Roassal2GT-Glamour' }
RTView >> openWithToolbar [
	^ GLMCompositePresentation new 
		title: 'Roassal';
		with: [:composite | composite roassal2 title: 'Painting'; initializeView: [self ] ];
		openOn: self
]

{ #category : #'*Roassal2GT-Glamour' }
RTView >> openWithToolbarEntitled: aTitle [
	^ self openWithToolbar title: aTitle
]

{ #category : #'*Roassal2GT-Spotter' }
RTView >> spotterPreviewIn: aComposite [
	<spotterPreview: 10>
	
	self build.
	aComposite addBrickBack: self view setUpCanvas buildMorph

	
]

{ #category : #'*Roassal2GT-Spotter' }
RTView >> spotterShapesFor: aStep [
	<spotterOrder: 10>
	^ aStep listProcessor
		title: 'Shapes';
		candidatesLimit: 5;
		allCandidates: [ self elements asOrderedCollection ];
		itemName: [ :each | 
			each gtDisplayString, 
			' [', each shape class name, '] - ', 
			each model gtDisplayString ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #'*Roassal2GT-Spotter' }
RTView >> spotterShapesModelsFor: aStep [
	<spotterOrder: 15>
	^ aStep listProcessor
		title: 'Model objects';
		candidatesLimit: 5;
		allCandidates: [ ((self elements collectAsSet: #model) reject: #isNil) asOrderedCollection ];
		itemName: [ :each | each gtDisplayString ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]
