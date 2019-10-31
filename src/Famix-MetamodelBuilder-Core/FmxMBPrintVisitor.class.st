"
I'm a visitor for instances of #FamixMetamodelGenerator and subclasses.

I just visit each node in the builder, and print it on the Transcript.

see FmxMBVisitor to see how to use me.


"
Class {
	#name : #FmxMBPrintVisitor,
	#superclass : #FmxMBWalkerVisitor,
	#category : #'Famix-MetamodelBuilder-Core-Visitors'
}

{ #category : #visiting }
FmxMBPrintVisitor >> visitBuilder: aBuilder [
	aBuilder logCr.
	super visitBuilder: aBuilder
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitClass: aClass [
	Transcript
		tab;
		nextPutAll: aClass name;
		cr.
	Transcript
		tab;
		nextPutAll: ' -|> '.
	aClass classGeneralization ifNotNil: [ :generalization | Transcript nextPutAll: generalization name ].
	aClass traitGeneralizations
		ifNotEmpty: [ :generalizations | 
			generalizations
				do: [ :generalization | 
					Transcript
						nextPutAll: ', ';
						nextPutAll: generalization name ] ].
	Transcript cr.

	super visitClass: aClass
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitRelationSide: aRelationSide [
	Transcript tab.
	Transcript tab.
	aRelationSide name logCr
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitTrait: aTrait [
	Transcript
		tab;
		nextPutAll: aTrait name;
		cr.

	super visitTrait: aTrait
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitTypedProperty: aTypedProperty [
	Transcript tab.
	Transcript tab.
	aTypedProperty logCr
]
