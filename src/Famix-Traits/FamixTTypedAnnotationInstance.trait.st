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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTypedAnnotationInstance >> annotationType [
	"Relation named: #annotationType type: #FamixTAnnotationType opposite: #instances"

	<generated>
	<MSEComment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). '>
	^ annotationType
]

{ #category : #accessing }
FamixTTypedAnnotationInstance >> annotationType: anObject [

	<generated>
	annotationType := anObject

]
