"
Description
--------------------

I am a specific ston reader used to manage famix tags import.
I generate a FamixTagImportReport to give info on how the import went.

Examples
--------------------

	(FamixTagSTONReader on: aStream)
		tagModel: aTagModel;
		mooseGroup: self;
		next;
		report
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	model: 		<aMooseGroup>					The model containing the entities to be tagged.
	report:		<aFamixTagImportReport>		A report of how the import went. (Created tags, missing entities...)
	tagModel:		<aTagModel>						The tag model in which the tags should be read or created.

"
Class {
	#name : #FamixTagSTONReader,
	#superclass : #STONReader,
	#instVars : [
		'tagModel',
		'report',
		'model'
	],
	#category : #'Famix-Tagging-ImportExport'
}

{ #category : #initialization }
FamixTagSTONReader >> initialize [
	super initialize.
	self report: FamixTagImportReport new
]

{ #category : #accessing }
FamixTagSTONReader >> model [
	^ model
]

{ #category : #accessing }
FamixTagSTONReader >> model: anObject [
	model := anObject
]

{ #category : #public }
FamixTagSTONReader >> next [
	| object |
	"Some reference could be ignored when the target entity of a tag does not exist"
	self consumeWhitespace.
	object := self parseValue.
	unresolvedReferences > 0
		ifTrue: [ self processSubObjectsOf: object ].
	^ object
]

{ #category : #accessing }
FamixTagSTONReader >> report [
	^ report
]

{ #category : #accessing }
FamixTagSTONReader >> report: anObject [
	report := anObject
]

{ #category : #parsing }
FamixTagSTONReader >> skipCurrentTag [
	self expectChar: $,.
	[ readStream atEnd ]
		whileFalse: [ self parseSimpleValue.
			self expectChar: $:.
			self parseValue.
			(self matchChar: $}) ifTrue: [ ^ self ].
			self expectChar: $, ]
]

{ #category : #accessing }
FamixTagSTONReader >> tagModel [
	^ tagModel
]

{ #category : #accessing }
FamixTagSTONReader >> tagModel: anObject [
	tagModel := anObject
]
