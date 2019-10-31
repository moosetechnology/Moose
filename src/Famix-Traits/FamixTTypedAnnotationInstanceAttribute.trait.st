Trait {
	#name : #FamixTTypedAnnotationInstanceAttribute,
	#instVars : [
		'#annotationTypeAttribute => FMOne type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances'
	],
	#category : #'Famix-Traits-AnnotationTypeAttribute'
}

{ #category : #meta }
FamixTTypedAnnotationInstanceAttribute classSide >> annotation [

	<FMClass: #TTypedAnnotationInstanceAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTypedAnnotationInstanceAttribute >> annotationTypeAttribute [
	"Relation named: #annotationTypeAttribute type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances"

	<generated>
	<FMComment: 'This corresponds to the type of the attribute in an AnnotationInstance'>
	^ annotationTypeAttribute
]

{ #category : #accessing }
FamixTTypedAnnotationInstanceAttribute >> annotationTypeAttribute: anObject [

	<generated>
	annotationTypeAttribute := anObject
]
