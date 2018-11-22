Class {
	#name : #FAMIXNameResolverTest,
	#superclass : #TestCase,
	#category : #'Famix-Utils-Tests'
}

{ #category : #helpers }
FAMIXNameResolverTest >> actualClass [
	^ FAMIXNameResolver
]

{ #category : #tests }
FAMIXNameResolverTest >> testFamixFullClassNameForSmalltalkClass [
	self assert: self class name equals: (self actualClass moosify: self class name) asSymbol.
	self assert: self class class mooseName equals: ('Smalltalk::' , (self actualClass moosify: self class name) , self actualClass metaclassTag) asSymbol
]

{ #category : #tests }
FAMIXNameResolverTest >> testFindClassNamed [
	self assert: (self actualClass findClassNamedOrNilFromFullName: #Object) equals: Object.
	self assert: (self actualClass findClassNamedOrNilFromFullName: #ObjectAbsent) isNil
]

{ #category : #tests }
FAMIXNameResolverTest >> testFindClassNamedOrNil [
	self assert: (self actualClass findClassNamedOrNilFromFullName: Model name) equals: Model.
	self assert: (self actualClass findClassNamedOrNilFromFullName: (self actualClass name , self actualClass metaclassTag) asSymbol) isNil
]

{ #category : #tests }
FAMIXNameResolverTest >> testGroupedBy [
	| res |
	res := #(1 2 3 4 5) groupedBy: [ :each | each odd ].
	self assert: (res at: true) equals: #(1 3 5).
	self assert: (res at: false) equals: #(2 4)
]

{ #category : #tests }
FAMIXNameResolverTest >> testResolvingName [
	self assert: (self actualClass smalltalkClassFromFamixClassName: #Object ifAbsent: [  ]) equals: Object.
	self assert: (self actualClass smalltalkClassFromFamixClassName: #FooBarZorkAbsent ifAbsent: [ 10 ]) == 10
]

{ #category : #tests }
FAMIXNameResolverTest >> testSmalltalkNameFromFAMIXNAme [
	self assert: (self actualClass smalltalkClassNameFromFamixClassName: #Object) equals: #Object.
	self assert: (self actualClass smalltalkClassNameFromFamixClassName: #FooBarZorkAbsent) equals: #FooBarZorkAbsent.
	self assert: (self actualClass smalltalkClassNameFromFamixClassName: #M::FooBarZorkAbsent) equals: #FooBarZorkAbsent
]
