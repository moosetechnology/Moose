Trait {
	#name : #FamixTTypedAnnotationInstanceAttribute,
	#instVars : [
		'#annotationTypeAttribute => FMOne type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances'
	],
	#category : #'Famix-Traits-AnnotationTypeAttribute'
}

{ #category : #meta }
FamixTTypedAnnotationInstanceAttribute classSide >> annotation [

	<MSEClass: #TTypedAnnotationInstanceAttribute super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTypedAnnotationInstanceAttribute classSide >> generatedSlotNames [
	<generated>
	'FamixTTypedAnnotationInstanceAttribute class>>#generatedSlotNames'.
	^ #(annotationTypeAttribute)
]

{ #category : #generator }
FamixTTypedAnnotationInstanceAttribute classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTypedAnnotationInstanceAttribute >> annotationTypeAttribute [

	<generated>
	<MSEComment: 'This corresponds to the type of the attribute in an AnnotationInstance'>
	^ annotationTypeAttribute
]

{ #category : #accessing }
FamixTTypedAnnotationInstanceAttribute >> annotationTypeAttribute: anObject [

	<generated>
	annotationTypeAttribute := anObject

]
