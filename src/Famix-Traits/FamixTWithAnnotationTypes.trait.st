Trait {
	#name : #FamixTWithAnnotationTypes,
	#instVars : [
		'#definedAnnotationTypes => FMMany type: #FamixTAnnotationType opposite: #annotationTypesContainer'
	],
	#category : #'Famix-Traits-AnnotationType'
}

{ #category : #meta }
FamixTWithAnnotationTypes classSide >> annotation [

	<MSEClass: #TWithAnnotationTypes super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithAnnotationTypes classSide >> generatedSlotNames [
	<generated>
	'FamixTWithAnnotationTypes class>>#generatedSlotNames'.
	^ #(definedAnnotationTypes)
]

{ #category : #generator }
FamixTWithAnnotationTypes classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithAnnotationTypes >> definedAnnotationTypes [

	<generated>
	<MSEComment: 'The container in which the AnnotationTypes may be declared'>
	^ definedAnnotationTypes
]

{ #category : #accessing }
FamixTWithAnnotationTypes >> definedAnnotationTypes: anObject [

	<generated>
	definedAnnotationTypes value: anObject

]
