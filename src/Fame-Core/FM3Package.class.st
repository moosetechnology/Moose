"
A FM3PackageDescription is 
"
Class {
	#name : #FM3Package,
	#superclass : #FM3Element,
	#instVars : [
		'classes',
		'extensions'
	],
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3Package class >> annotation [
	<MSEClass: #Package super: #FM3Element>
	<package: #FM3>

]

{ #category : #examples }
FM3Package class >> gtExampleBasic [
	<gtExample>
	^ self new
]

{ #category : #'accessing-query' }
FM3Package >> at: aString [
	aString isSymbol ifTrue: [ self error ].
	^ self classNamed: aString
]

{ #category : #'accessing-query' }
FM3Package >> classNamed: aString [
	^ self classNamed: aString ifAbsent: [ nil ]
]

{ #category : #'accessing-query' }
FM3Package >> classNamed: aString ifAbsent: aBlock [
	^ classes byName: aString ifAbsent: aBlock
]

{ #category : #accessing }
FM3Package >> classes [
	<MSEProperty: #classes type: #FM3Class opposite: #package>
	<multivalued>
	<key: #name>
	^classes
]

{ #category : #accessing }
FM3Package >> classes: elementCollection [

	classes value: elementCollection
]

{ #category : #accessing }
FM3Package >> extensions [
	<MSEProperty: #extensions type: 'FM3.Property' opposite: #package>
	<multivalued>
	
	^extensions
]

{ #category : #accessing }
FM3Package >> extensions: elementCollection [

	extensions value: elementCollection
]

{ #category : #ui }
FM3Package >> gtInspectorClassesIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastList
		title: 'Classes';
		display: [ self classes sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | 
			each isAbstract 
				ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
				ifFalse: [ Text fromString: each fullName ] ]
]

{ #category : #ui }
FM3Package >> gtInspectorExtensionsIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastList
		title: 'Extensions';
		display: [ self extensions sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | each gtDisplayString ]
]

{ #category : #testing }
FM3Package >> hasOwner [
	^ false
]

{ #category : #initialization }
FM3Package >> initialize [
	super initialize.
	classes := FMMultivalueLink on: self opposite: #package:.
	extensions := FMMultivalueLink on: self opposite: #package:
]

{ #category : #testing }
FM3Package >> isFM3Package [
	^true
]

{ #category : #accessing }
FM3Package >> packageName [

	^ self name
]
