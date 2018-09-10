Class {
	#name : #FAMIXNameResolverTest,
	#superclass : #TestCase,
	#category : #'Famix-Support'
}

{ #category : #tests }
FAMIXNameResolverTest >> testFindClassNamed [

	self assert: (FAMIXNameResolver findClassNamedOrNilFromFullName: #Object) == Object.
	self assert: (FAMIXNameResolver findClassNamedOrNilFromFullName: #ObjectAbsent) isNil.
]

{ #category : #tests }
FAMIXNameResolverTest >> testResolvingName [
	self assert: (FAMIXNameResolver smalltalkClassFromFamixClassName: #Object ifAbsent: []) == Object.
	self assert: (FAMIXNameResolver smalltalkClassFromFamixClassName: #FooBarZorkAbsent ifAbsent: [10]) == 10.
	

]

{ #category : #tests }
FAMIXNameResolverTest >> testSmalltalkNameFromFAMIXNAme [
	self assert: (FAMIXNameResolver smalltalkClassNameFromFamixClassName: #Object) == #Object.
	self assert: (FAMIXNameResolver smalltalkClassNameFromFamixClassName: #FooBarZorkAbsent) == #FooBarZorkAbsent.
	
	self assert: (FAMIXNameResolver smalltalkClassNameFromFamixClassName: #M::FooBarZorkAbsent) == #FooBarZorkAbsent
]
