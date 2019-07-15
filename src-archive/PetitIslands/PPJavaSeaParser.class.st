Class {
	#name : #PPJavaSeaParser,
	#superclass : #PPJavaSeaGrammar,
	#category : #'PetitIslands-Examples'
}

{ #category : #'as yet unclassified' }
PPJavaSeaParser >> javaClass [
	^ super javaClass
	
	map: [:_def :_body |
		PJTypeDeclarationNode new
			modifiers: _def first;
			simpleName: _def third;
			methodDeclarations: _body
			yourself
	]
]

{ #category : #'as yet unclassified' }
PPJavaSeaParser >> methodDef [
	^ super methodDef ==> [:tokens | 
		PJMethodDeclarationNode new
			returnType: tokens second first second;
			simpleName: tokens second second second first;
			yourself
	]
]
