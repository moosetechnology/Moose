Class {
	#name : #EntityClassFactory,
	#superclass : #Object,
	#category : #FmxStImporter
}

{ #category : #'as yet unclassified' }
EntityClassFactory >> classEntity [ 

	^ MiniStClass
]

{ #category : #'as yet unclassified' }
EntityClassFactory >> comment [

	^ MiniStComment
]

{ #category : #'as yet unclassified' }
EntityClassFactory >> inheritance [

	^ MiniStInheritance
]

{ #category : #'as yet unclassified' }
EntityClassFactory >> method [

	^ MiniStMethod
]

{ #category : #'as yet unclassified' }
EntityClassFactory >> namespace [

	^ MiniStNamespace
]

{ #category : #'as yet unclassified' }
EntityClassFactory >> package [

	^ MiniStPackage
]

{ #category : #'as yet unclassified' }
EntityClassFactory >> sourceAnchor [

	^ MiniStSourceAnchor
]
