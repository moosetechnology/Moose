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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithAnnotationTypes >> addDefinedAnnotationType: aDefinedAnnotationType [
	definedAnnotationTypes add: aDefinedAnnotationType 

]

{ #category : #accessing }
FamixTWithAnnotationTypes >> definedAnnotationTypes [
	"Relation named: #definedAnnotationTypes type: #FamixTAnnotationType opposite: #annotationTypesContainer"

	<generated>
	<MSEComment: 'The container in which the AnnotationTypes may be declared'>
	^ definedAnnotationTypes
]

{ #category : #accessing }
FamixTWithAnnotationTypes >> definedAnnotationTypes: anObject [

	<generated>
	definedAnnotationTypes value: anObject

]
