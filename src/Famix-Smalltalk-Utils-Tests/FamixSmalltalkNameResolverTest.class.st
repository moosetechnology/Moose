Class {
	#name : #FamixSmalltalkNameResolverTest,
	#superclass : #TestCase,
	#category : #'Famix-Smalltalk-Utils-Tests'
}

{ #category : #helpers }
FamixSmalltalkNameResolverTest >> actualClass [
	^ FamixSmalltalkNameResolver
]

{ #category : #tests }
FamixSmalltalkNameResolverTest >> testFamixFullClassNameForSmalltalkClass [
	self assert: self class name equals: (self actualClass moosify: self class name) asSymbol.
	self assert: self class class mooseName equals: ('Smalltalk::' , (self actualClass moosify: self class name) , self actualClass metaclassTag) asSymbol
]

{ #category : #tests }
FamixSmalltalkNameResolverTest >> testFindClassNamed [
	self assert: (self actualClass findClassNamedOrNilFromFullName: #Object) equals: Object.
	self assert: (self actualClass findClassNamedOrNilFromFullName: #ObjectAbsent) isNil
]

{ #category : #tests }
FamixSmalltalkNameResolverTest >> testFindClassNamedOrNil [
	self assert: (self actualClass findClassNamedOrNilFromFullName: Model name) equals: Model.
	self assert: (self actualClass findClassNamedOrNilFromFullName: (self actualClass name , self actualClass metaclassTag) asSymbol) isNil
]

{ #category : #tests }
FamixSmalltalkNameResolverTest >> testGroupedBy [
	| res |
	res := #(1 2 3 4 5) groupedBy: [ :each | each odd ].
	self assert: (res at: true) equals: #(1 3 5).
	self assert: (res at: false) equals: #(2 4)
]

{ #category : #tests }
FamixSmalltalkNameResolverTest >> testResolvingName [
	self assert: (self actualClass smalltalkClassFromFamixClassName: #Object ifAbsent: [  ]) equals: Object.
	self assert: (self actualClass smalltalkClassFromFamixClassName: #FooBarZorkAbsent ifAbsent: [ 10 ]) identicalTo: 10
]

{ #category : #tests }
FamixSmalltalkNameResolverTest >> testSmalltalkNameFromFAMIXNAme [
	self assert: (self actualClass smalltalkClassNameFromFamixClassName: #Object) equals: #Object.
	self assert: (self actualClass smalltalkClassNameFromFamixClassName: #FooBarZorkAbsent) equals: #FooBarZorkAbsent.
	self assert: (self actualClass smalltalkClassNameFromFamixClassName: #M::FooBarZorkAbsent) equals: #FooBarZorkAbsent
]
