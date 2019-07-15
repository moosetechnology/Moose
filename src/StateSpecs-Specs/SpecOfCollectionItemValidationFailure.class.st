"
I represent collection validation failure for expected item. 
I provide more suitable description about wrong collection item.

Internal Representation and Key Implementation Points.

    Instance Variables
	wrongItem:		<Object>
"
Class {
	#name : #SpecOfCollectionItemValidationFailure,
	#superclass : #SpecOfValidationFailure,
	#instVars : [
		'wrongItem'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfCollectionItemValidationFailure class >> noItemIn: aCollection butShouldBe: aSpecOfCollectionItem [

	^self spec: aSpecOfCollectionItem for: aCollection
]

{ #category : #'instance creation' }
SpecOfCollectionItemValidationFailure class >> unexpectedItem: itemObject in: aCollection butShouldBe: aSpecOfCollectionItem [

	^(self spec: aSpecOfCollectionItem for: aCollection)
		wrongItem: itemObject
]

{ #category : #displaying }
SpecOfCollectionItemValidationFailure >> description [
	wrongItem ifNil: [ ^subject stringForSpecValidation, ' not includes key ', spec containingKey printString, ' which item ' , spec itemDescription ].
	
	^'Got "', wrongItem stringForSpecValidation , '" at key ', spec containingKey printString, ' of ', subject stringForSpecValidation , ' but ', spec itemDescription 
]

{ #category : #accessing }
SpecOfCollectionItemValidationFailure >> wrongItem [
	^ wrongItem
]

{ #category : #accessing }
SpecOfCollectionItemValidationFailure >> wrongItem: anObject [
	wrongItem := anObject
]
