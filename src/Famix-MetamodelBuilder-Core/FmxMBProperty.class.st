"
FamixMetamodelBuilderProperty
"
Class {
	#name : #FmxMBProperty,
	#superclass : #FmxMBEntity,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBProperty >> asSlot [

	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #generating }
FmxMBProperty >> generateAccessorsIn: aClassOrTrait [

	self generateGetterIn: aClassOrTrait.
	self generateSetterIn: aClassOrTrait.	
	self generateExtendedContainersIn: aClassOrTrait.
]

{ #category : #generating }
FmxMBProperty >> generateExtendedContainersIn: aClassOrTrait [
]

{ #category : #generating }
FmxMBProperty >> generateGetterIn: aClassOrTrait [

	<ignoreForCoverage>
]

{ #category : #generating }
FmxMBProperty >> generateSetterIn: aClassOrTrait [

	<ignoreForCoverage>
]

{ #category : #accessing }
FmxMBProperty >> initialize [

	super initialize.	

	comment := String new.

]

{ #category : #printing }
FmxMBProperty >> isContainer [

	^ false
]

{ #category : #printing }
FmxMBProperty >> printOn: aStream [

	<ignoreForCoverage>

	super printOn: aStream.
	
	aStream 
		nextPutAll: '(';
		nextPutAll: (self name ifNil: ['']);
		nextPutAll: ')'
]

{ #category : #printing }
FmxMBProperty >> producesSlot [

	^ true
]
