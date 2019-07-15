Trait {
	#name : #FamixTTypedAnnotationInstance,
	#instVars : [
		'#annotationType => FMOne type: #FamixTAnnotationType opposite: #instances'
	],
	#category : #'Famix-Traits-AnnotationType'
}

{ #category : #meta }
FamixTTypedAnnotationInstance classSide >> annotation [

	<MSEClass: #TTypedAnnotationInstance super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTypedAnnotationInstance classSide >> generatedSlotNames [
	<generated>
	'FamixTTypedAnnotationInstance class>>#generatedSlotNames'.
	^ #(annotationType)
]

{ #category : #generator }
FamixTTypedAnnotationInstance classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTypedAnnotationInstance >> annotationType [

	<generated>
	<MSEComment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). '>
	^ annotationType
]

{ #category : #accessing }
FamixTTypedAnnotationInstance >> annotationType: anObject [

	<generated>
	annotationType := anObject

]
