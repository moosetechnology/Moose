Trait {
	#name : #FamixTWithAnnotationInstanceAttributes,
	#instVars : [
		'#attributes => FMMany type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance'
	],
	#category : #'Famix-Traits-AnnotationInstanceAttribute'
}

{ #category : #meta }
FamixTWithAnnotationInstanceAttributes classSide >> annotation [

	<MSEClass: #TWithAnnotationInstanceAttributes super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> addAttribute: anAttribute [
	attributes add: anAttribute
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> attributes [

	<generated>
	<MSEComment: 'This corresponds to the actual values of the attributes in an AnnotationInstance'>
	"Relation named: #attributes type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance"

	^ attributes
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject

]
