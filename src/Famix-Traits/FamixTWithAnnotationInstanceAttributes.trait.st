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
	<generated>
	<package: #'Famix-Traits'>
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
	^ attributes
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject

]
