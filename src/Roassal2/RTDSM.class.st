"
RTDSM build a Dependency Structural Matrix for a collection of objects and an arbitrary dependency function.

For example, inspect the following:
[[[ 
	dsm := RTDSM new.
	dsm objects: RTShape withAllSubclasses.
	dsm dependency: #dependentClasses.
	^ dsm
]]]
"
Class {
	#name : #RTDSM,
	#superclass : #RTAbstractDSM,
	#instVars : [
		'dependency'
	],
	#category : #'Roassal2-Builder-DSM'
}

{ #category : #examples }
RTDSM class >> example01 [
	<script: 'self example01 inspect'>
	| dsm |
	dsm := RTDSM new.
	dsm objects: RTShape withAllSubclasses.
	dsm dependency: #dependentClasses.
	^ dsm
]

{ #category : #examples }
RTDSM class >> example02 [
	<script: 'self example02 inspect'>
	| dsm |
	dsm := RTDSM new.
	dsm objects: (1 to: 10).
	dsm dependency: [ :aValue | aValue // 2 ].
	^ dsm
]

{ #category : #examples }
RTDSM class >> example03 [
	<script: 'self example03 inspect'>
	| values b |
	values := (Array
		with: (1 -> #(A B C))
		with: (2 -> #(A C))
		with: (3 -> #(B))
		with: (4 -> #())) asDictionary.

	b := RTDSM new.
	b objectsX: #(A B C).
	b objectsY: #(1 2 3 4).
	b dependency: [ :v | values at: v ].
	^ b
]

{ #category : #examples }
RTDSM class >> example04Authorship [
	<script: 'self example04Authorship inspect'>
	| classes classesToAuthors authors authorsToClasses b |
	classes := RTShape withAllSubclasses.
	classesToAuthors := (classes collect: [ :cls | cls -> ((cls methods collect: #author) asSet sortedAs: #yourself ) ]) asDictionary.
	authors := (classesToAuthors values flatCollect: #yourself )asSet sortedAs: #yourself.
	authorsToClasses := (authors collect: [ :anAuthor | anAuthor -> (classesToAuthors associations select: [ :as | as value includes: anAuthor ] thenCollect: #key) ] ) asDictionary.

	b := RTDSM new.
	b objectsX: classes.
	b objectsY: authors.
	b dependency: [ :author | authorsToClasses at: author ].
	^ b
]

{ #category : #accessing }
RTDSM >> dependency [
	^ dependency
]

{ #category : #accessing }
RTDSM >> dependency: aOneArgBlock [
	dependency := aOneArgBlock
]

{ #category : #initialization }
RTDSM >> initialize [
	"
	:: Void -> RTDSM
	"
	super initialize.
	dependency := #yourself.
	self shape
		if: [ :assoc | self isAssocDependent: assoc ] fillColor: Color red.
	
]

{ #category : #testing }
RTDSM >> isAssocDependent: assoc [
	| v |
	v := dependency rtValue: assoc key.
	v = assoc value ifTrue: [ ^ true ].
	^ v isCollection
		ifTrue: [ v includes: assoc value ]
		ifFalse: [ false ]
]
