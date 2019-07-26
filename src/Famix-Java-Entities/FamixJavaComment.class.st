Class {
	#name : #FamixJavaComment,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaComment class >> annotation [

	<MSEClass: #Comment super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaComment >> asFamixJavaComment [
	^ self
]

{ #category : #'as yet unclassified' }
FamixJavaComment >> belongsTo [
	
	^ self container
]

{ #category : #'as yet unclassified' }
FamixJavaComment >> gtDisplayOn: aStream [
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

{ #category : #'as yet unclassified' }
FamixJavaComment >> printOn: aStream [
	self sourceText ifNotNil: [ :sourceText | aStream nextPutAll: (sourceText contractTo: 50) ].
	aStream nextPutAll: ' (comment on '.
	self container printOn: aStream.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
FamixJavaComment >> sourceText [
	^ self content ifNil: [ self sourceAnchor ifNil: [ '' ] ifNotNil: [ :sa | sa sourceText ] ]
]
