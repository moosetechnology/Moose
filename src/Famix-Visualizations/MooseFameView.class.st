"
self new open
"
Class {
	#name : #MooseFameView,
	#superclass : #Object,
	#category : #'Famix-Visualizations-Fame'
}

{ #category : #opening }
MooseFameView >> open [
	^ self openOn: FamixStModel metamodel
]

{ #category : #opening }
MooseFameView >> openOn: aMetamodel [ 
	"
		self new openOn: MooseModel meta.
		
		self new openOn: FMMetaRepository fm3.
	"
	^ self viewFameClasses: aMetamodel classes
]

{ #category : #private }
MooseFameView >> propertyLabel: aFM3Property [
	
	^ String streamContents: [ :str |
		( aFM3Property isDerived ) ifTrue: [ str nextPut: $/ ].
		str nextPutAll: aFM3Property name copy.
		str nextPut: $: ; nextPut: $ ; nextPutAll: aFM3Property type name.
		( aFM3Property isMultivalued ) ifTrue: [ str nextPut: $* ].
		( aFM3Property hasOpposite ) ifTrue: [ str nextPutAll: ' -> ', aFM3Property opposite name ]		
	]

]

{ #category : #private }
MooseFameView >> viewFameClasses: classes [
	| builder |
	builder := RSUMLClassBuilder new
		classes: classes;
		yourself.
	builder modelDescriptor
		instVars: [ :metaDescription | metaDescription primitiveProperties ];
		instVarSelector: [ :metaDescription | metaDescription implementingSelector ];
		methods: [ :metaDescription | metaDescription complexProperties ];
		methodSelector: [ :metaDescription | metaDescription implementingSelector ].
	builder build.
	^ builder canvas openWithTitle: 'Fame UML'
]

{ #category : #opening }
MooseFameView >> viewFamixCore [

	" This method displays Famix core classes i.e., Famix classes declared in FAMIX package."

	^ self viewFameClasses: FamixStModel metamodel classes
]
