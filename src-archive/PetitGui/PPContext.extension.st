Extension { #name : #PPContext }

{ #category : #'*PetitGui' }
PPContext >> gtGlobals: composite [
	<gtInspectorPresentationOrder: 50>
	
	composite table
		title: 'Globals';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :context |  (context globals ifNil: [ Dictionary new ]) associations ]


]

{ #category : #'*PetitGui' }
PPContext >> gtIndentStack: composite [
	<gtInspectorPresentationOrder: 40>
	
	
	composite list
		title: 'Indent Stack';
		display: [ :context | context indentStack contents ]

]

{ #category : #'*PetitGui' }
PPContext >> gtProperties: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite table
		title: 'Properties';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :context |  (context properties ifNil: [ Dictionary new ]) associations ]


]

{ #category : #'*PetitGui' }
PPContext >> gtStream: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | context stream printOn: (WriteStream on: String new) ]

]
