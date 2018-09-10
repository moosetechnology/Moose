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

{ #category : #generator }
FamixTWithAnnotationInstanceAttributes classSide >> generatedSlotNames [
	<generated>
	'FamixTWithAnnotationInstanceAttributes class>>#generatedSlotNames'.
	^ #(attributes)
]

{ #category : #generator }
FamixTWithAnnotationInstanceAttributes classSide >> generatedTraitNames [
	<generated>
	^ #()
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
