Class {
	#name : #FmxMBProperty,
	#superclass : #FmxMBEntity,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #testing }
FmxMBProperty class >> isAbstract [
	^ self = FmxMBProperty
]

{ #category : #accessing }
FmxMBProperty >> asSlot [

	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #generating }
FmxMBProperty >> generateAccessorsIn: aClassOrTrait [
	self generateGetterIn: aClassOrTrait.
	self generateSetterIn: aClassOrTrait
]

{ #category : #generating }
FmxMBProperty >> generateGetterIn: aClassOrTrait [
	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #generating }
FmxMBProperty >> generateSetterIn: aClassOrTrait [
	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #accessing }
FmxMBProperty >> initialize [
	super initialize.
	comment := ''
]

{ #category : #printing }
FmxMBProperty >> isContainer [
	^ false
]

{ #category : #printing }
FmxMBProperty >> printOn: aStream [
	<ignoreForCoverage>
	super printOn: aStream.
	self name
		ifNotNil: [ :n | 
			aStream
				nextPut: $(;
				nextPutAll: n;
				nextPut: $) ]
]

{ #category : #printing }
FmxMBProperty >> producesSlot [
	^ true
]
