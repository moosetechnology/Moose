Class {
	#name : #FMMetaMetaModel,
	#superclass : #FMMetaModel,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Fame-Core-Models'
}

{ #category : #accessing }
FMMetaMetaModel class >> default [
	^ UniqueInstance ifNil: [ UniqueInstance := super new ]
]

{ #category : #'instance creation' }
FMMetaMetaModel class >> new [
	^ self error: 'The FMMetaMetaModel should be accessed via the #default method. In case you need a new instance for tests purposes you can use #testMetaMetaModel.'
]

{ #category : #initialization }
FMMetaMetaModel class >> reset [
	<script>
	UniqueInstance := nil
]

{ #category : #accessing }
FMMetaMetaModel class >> testMetaMetaModel [
	^ super new
]

{ #category : #initialization }
FMMetaMetaModel >> defaultMetamodel [
	"The Meta Meta Model is its own Meta model."
	^ self
]

{ #category : #initialization }
FMMetaMetaModel >> initialize [
	super initialize.
	self
		addAll:
			(FMMetaModelBuilder new
				buildFM3;
				elements)
]

{ #category : #testing }
FMMetaMetaModel >> isMetaMetamodel [
	^ true
]
