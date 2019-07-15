"
FAMIXComment represents one instance of a comment (in the sense of programming language comments) for any Famix sourced entity. The commented sourced entity is called the container in the FAMIX model.
"
Class {
	#name : #FAMIXComment,
	#superclass : #FAMIXSourcedEntity,
	#instVars : [
		'container'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXComment class >> annotation [
	<MSEClass: #Comment super: #FAMIXSourcedEntity>
	<package: #FAMIX>
]

{ #category : #'instance creation' }
FAMIXComment class >> content: aString [
	^ self new
		content: aString;
		yourself
]

{ #category : #converting }
FAMIXComment >> asFAMIXComment [
	^ self
]

{ #category : #accessing }
FAMIXComment >> container [
	"<container> -> add this make 127 test failing becase we expect that I understand the moose queries basic elements - But it should be added to have a complete metamodel"

	<MSEProperty: #container type: #FAMIXSourcedEntity opposite: #comments>
	<MSEComment: 'Source code entity containing the comment'>
	self flag: #FIXME.
	^ container
]

{ #category : #accessing }
FAMIXComment >> container: aContainer [
	container := FMMultivalueLink on: self
					update: #comments
					from: self container
					to: aContainer
]

{ #category : #accessing }
FAMIXComment >> content [
	"Be careful. Do not get my content via this method because it is possible that I don't have my content in this property but I can have it via a sourceAnchor."

	<MSEProperty: #content type: #String>
	<MSEComment: 'Content of the comment as a String'>
	^ self privateState attributeAt: #content ifAbsent: [  ]
]

{ #category : #accessing }
FAMIXComment >> content: aString [
	self privateState attributeAt: #content put: aString
]

{ #category : #accessing }
FAMIXComment >> gtDisplayOn: aStream [
	| preview |
	preview := self sourceText truncate: 10.
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

{ #category : #accessing }
FAMIXComment >> sourceText [
	^ self content ifNil: [ self sourceAnchor ifNil: [ '' ] ifNotNil: [ :sa | sa sourceText ] ]
]
