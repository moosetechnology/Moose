"
A FM3PackageDescription is 
"
Class {
	#name : #FM3PackageDescription,
	#superclass : #FM3Element,
	#instVars : [
		'classes',
		'extensions'
	],
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3PackageDescription class >> annotation [
	<MSEClass: #Package super: #FM3Element>
	<package: #FM3>

]

{ #category : #examples }
FM3PackageDescription class >> gtExampleBasic [
	<gtExample>
	^ self new
]

{ #category : #'accessing-query' }
FM3PackageDescription >> at: aString [
	aString isSymbol ifTrue: [ self error ].
	^ self classNamed: aString
]

{ #category : #'accessing-query' }
FM3PackageDescription >> classNamed: aString [
	^ classes byName: aString ifAbsent: nil
]

{ #category : #accessing }
FM3PackageDescription >> classes [
	<MSEProperty: #classes type: #FM3MetaDescription opposite: #package>
	<multivalued>
	<key: #name>
	^classes
]

{ #category : #accessing }
FM3PackageDescription >> classes: elementCollection [

	classes value: elementCollection
]

{ #category : #accessing }
FM3PackageDescription >> extensions [
	<MSEProperty: #extensions type: 'FM3.Property' opposite: #package>
	<multivalued>
	
	^extensions
]

{ #category : #accessing }
FM3PackageDescription >> extensions: elementCollection [

	extensions value: elementCollection
]

{ #category : #ui }
FM3PackageDescription >> gtInspectorClassesIn: composite [
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
FM3PackageDescription >> gtInspectorExtensionsIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastList
		title: 'Extensions';
		display: [ self extensions sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | each gtDisplayString ]
]

{ #category : #testing }
FM3PackageDescription >> hasOwner [
	^ false
]

{ #category : #private }
FM3PackageDescription >> initialize [

	classes := FMMultivalueLink on: self opposite: #package:.
	extensions := FMMultivalueLink on: self opposite: #package:.
]

{ #category : #testing }
FM3PackageDescription >> isFM3Package [
	^true
]

{ #category : #accessing }
FM3PackageDescription >> packageName [

	^ self name
]
