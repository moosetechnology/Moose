Class {
	#name : #FmxMethodAdditions,
	#superclass : #FmxLazyClassChange,
	#instVars : [
		'rgMethods'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxMethodAdditions class >> className: aSymbol isClassSide: aBoolean rgMethods: aCollection [
	^ self new
		className: aSymbol;
		isClassSide: aBoolean;
		rgMethods: aCollection;
		yourself
]

{ #category : #accessing }
FmxMethodAdditions >> apply [
	| class |
	class := self realClass.
	self rgMethods do: [ :method | self compile: method into: class ]
]

{ #category : #compiling }
FmxMethodAdditions >> compile: aRGMethod into: realClass [
	^ realClass compile: aRGMethod sourceCode classified: aRGMethod protocol
]

{ #category : #accessing }
FmxMethodAdditions >> rgMethods [
	^ rgMethods
]

{ #category : #accessing }
FmxMethodAdditions >> rgMethods: anObject [
	rgMethods := anObject
]
