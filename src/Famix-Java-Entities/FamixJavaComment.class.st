Class {
	#name : #FamixJavaComment,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaComment class >> annotation [

	<FMClass: #Comment super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #converting }
FamixJavaComment >> asFamixJavaComment [
	^ self
]

{ #category : #deprecated }
FamixJavaComment >> belongsTo [
	
	^ self container
]

{ #category : #printing }
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
	self belongsTo ifNotNil: [ :bt | bt gtDisplayOn: aStream ]
]

{ #category : #printing }
FamixJavaComment >> printOn: aStream [
	self sourceText ifNotNil: [ :sourceText | aStream nextPutAll: (sourceText contractTo: 50) ].
	aStream nextPutAll: ' (comment on '.
	self container printOn: aStream.
	aStream nextPut: $)
]
