Class {
	#name : #PPXmlParent,
	#superclass : #PPXmlNode,
	#instVars : [
		'children'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlParent class >> children: anArray [
	^ self basicNew
		setChildren: anArray;
		yourself
]

{ #category : #comparing }
PPXmlParent >> = anXmlNode [
	self == anXmlNode
		ifTrue: [ ^ true ].
	self class = anXmlNode class
		ifFalse: [ ^ false ].
	self children size = anXmlNode children size
		ifFalse: [ ^ false ].
	self children with: anXmlNode children do: [ :first :second |
		first = second 
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
PPXmlParent >> children [
	^ children
]

{ #category : #comparing }
PPXmlParent >> hash [
	^ self children size hash
]

{ #category : #copying }
PPXmlParent >> postCopy [
	super postCopy.
	self setChildren: (self children
		collect: [ :each | each copy ])
]

{ #category : #printing }
PPXmlParent >> printXmlOn: aStream [
	self children
		do: [ :each | each printXmlOn: aStream ]
]

{ #category : #initialization }
PPXmlParent >> setChildren: aCollection [
	children := aCollection asArray
		collect: [ :each | each setParent: self ]
]
