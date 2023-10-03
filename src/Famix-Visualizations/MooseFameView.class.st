"
self new open
"
Class {
	#name : #MooseFameView,
	#superclass : #Object,
	#category : #'Famix-Visualizations-Fame'
}

{ #category : #default }
MooseFameView class >> defaultTitle [

	^ 'Fame UML'
]

{ #category : #opening }
MooseFameView class >> fameCore [

	<script>
	self new openOn: MooseModel metamodel
]

{ #category : #opening }
MooseFameView class >> metaMetaModel [

	<script>
	self new openOn: FMMetaMetaModel default
]

{ #category : #private }
MooseFameView >> buildForClasses: classes [

	| builder |
	builder := RSUMLClassBuilder new
		           classes: classes;
		           yourself.
	builder modelDescriptor
		instVars: [ :metaDescription | metaDescription primitiveProperties ];
		instVarSelector: [ :metaDescription |
			metaDescription implementingSelector ];
		methods: [ :metaDescription | metaDescription complexProperties ];
		methodSelector: [ :metaDescription |
			metaDescription implementingSelector ].
	builder build.
	^ builder canvas
]

{ #category : #opening }
MooseFameView >> openOn: aMetamodel [

	^ self openOn: aMetamodel titled: self class defaultTitle
]

{ #category : #opening }
MooseFameView >> openOn: aMetamodel titled: aString [

	^ (self buildForClasses: aMetamodel classes) openWithTitle: aString
]

{ #category : #private }
MooseFameView >> propertyLabel: aFM3Property [

	^ String streamContents: [ :str |
		  aFM3Property isDerived ifTrue: [ str nextPut: $/ ].
		  str
			  << aFM3Property name copy;
			  << ': ';
			  << aFM3Property type name.
		  aFM3Property isMultivalued ifTrue: [ str nextPut: $* ].
		  aFM3Property hasOpposite ifTrue: [
			  str
				  << ' -> ';
				  << aFM3Property opposite name ] ]
]
