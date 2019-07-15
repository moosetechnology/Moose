Class {
	#name : #FAMIXComment,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXComment class >> annotation [

	<MSEClass: #Comment super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXComment class >> generatedSlotNames [
	<generated>
	'FAMIXComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXComment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FAMIXComment class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXComment >> accept: aVisitor [

	aVisitor visitComment: self
]

{ #category : #converting }
FAMIXComment >> asFAMIXComment [
	^ self
]

{ #category : #'Famix-Implementation' }
FAMIXComment >> belongsTo [
	
	^ self container
]

{ #category : #'Famix-Extensions' }
FAMIXComment >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self content: anEntity content copy
]

{ #category : #printing }
FAMIXComment >> gtDisplayOn: aStream [
	| preview |
	preview := self sourceText truncateWithElipsisTo: 10.
	preview := preview copyReplaceAll: (String with: Character cr with: Character lf) with: ' '.	
	preview := preview copyReplaceAll: (String with: Character cr) with: ' '.	
	preview := preview copyReplaceAll: (String with: Character lf) with: ' '.
	aStream 
		nextPut: $";
		nextPutAll: preview;
		nextPutAll: '" in '.
	self belongsTo notNil ifTrue: [
		self belongsTo gtDisplayOn: aStream ]
]

{ #category : #'Famix-Implementation' }
FAMIXComment >> printOn: aStream [
	self sourceText ifNotNil: [ :sourceText | aStream nextPutAll: (sourceText contractTo: 50) ].
	aStream nextPutAll: ' (comment on '.
	self container printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
FAMIXComment >> sourceText [
	^ self content ifNil: [ self sourceAnchor ifNil: [ '' ] ifNotNil: [ :sa | sa sourceText ] ]
]
