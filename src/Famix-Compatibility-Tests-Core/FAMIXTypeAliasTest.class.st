Class {
	#name : #FAMIXTypeAliasTest,
	#superclass : #FAMIXTypeTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXTypeAliasTest >> actualClass [
	^ FAMIXTypeAlias
]

{ #category : #tests }
FAMIXTypeAliasTest >> expectedFailures [
	^ #(testSuperclassesIncludingAlias)
]

{ #category : #tests }
FAMIXTypeAliasTest >> testAliasOpposite [
	| type alias |
	type := FAMIXType new.
	self assert: type typeAliases isEmpty.
	alias := self actualClass new
		aliasedType: type;
		yourself.
	self assert: alias aliasedType == type.
	self assert: type typeAliases size equals: 1.
	self assert: type typeAliases first == alias
]

{ #category : #tests }
FAMIXTypeAliasTest >> testAliasSubclasses [
	| type subtype alias |
	self skip.
	self flag: 'Manage alias after FamixNG refactoring'.
	subtype := FAMIXType new name: 'SubType'.
	type := FAMIXType new name: 'Type'.
	
	FAMIXInheritance new
		subclass: subtype;
		superclass: type.
		
	alias := self actualClass new
		name: 'Alias';
		aliasedType: type;
		yourself.
		
	self assert: type subclassHierarchy size equals: 1.
	self assert: type withSubclassHierarchy size equals: 3.
	self assert: alias subclassHierarchy size equals: 1.
	self assert: alias subclassHierarchy last equals: subtype.
	self assert: alias withSubclassHierarchy size equals: 3
]

{ #category : #tests }
FAMIXTypeAliasTest >> testAliasSuperclasses [
	| type supertype alias model |
	self skip.
	self flag: 'Manage alias after FamixNG refactoring'.
	model := MooseModel new.
	model sourceLanguage: FAMIXCSourceLanguage new.
	supertype := FAMIXType new
		name: 'SuperType';
		mooseModel: model;
		yourself.
	type := FAMIXType new
		name: 'Type';
		mooseModel: model;
		yourself.
	FAMIXInheritance new
		mooseModel: model;
		superclass: supertype;
		subclass: type.
	alias := self actualClass new
		mooseModel: model;
		yourself.
	alias aliasedType: type.
	self assert: type superclassHierarchy size equals: 1.
	self assert: type withSuperclassHierarchy size equals: 3.
	self assert: alias superclassHierarchy size equals: 1.
	self assert: alias superclassHierarchy last equals: supertype.
	self assert: alias withSuperclassHierarchy size equals: 3
]

{ #category : #tests }
FAMIXTypeAliasTest >> testAllTypeAliases [
	| type alias aliasalias |
	type := FAMIXType new name: 'Type'.
	alias := self actualClass new name: 'Alias'.
	alias aliasedType: type.
	aliasalias := self actualClass new name: 'Alias'.
	aliasalias aliasedType: alias.
	self assert: alias allTypeAliases size equals: 1.
	self assert: aliasalias allTypeAliases isEmpty.
	self assert: type allTypeAliases size equals: 2
]

{ #category : #tests }
FAMIXTypeAliasTest >> testNullAliasedType [
	| alias |
	alias := self actualClass new
		name: 'Alias';
		yourself.
	self assert: alias superclassHierarchy isEmpty.
	self assert: alias subclassHierarchy isEmpty
]

{ #category : #tests }
FAMIXTypeAliasTest >> testRealType [
	| type alias aliasalias |
	type := FAMIXType new name: 'Type'.
	alias := self actualClass new
		name: 'Alias';
		aliasedType: type;
		yourself.
	aliasalias := self actualClass new
		name: 'Alias';
		aliasedType: alias;
		yourself.
	self assert: alias realType equals: type.
	self assert: aliasalias realType equals: type.
	self assert: type realType equals: type
]

{ #category : #tests }
FAMIXTypeAliasTest >> testSuperclassesIncludingAlias [
	| type supertype alias subalias |
	supertype := FAMIXType new name: 'SuperType'.
	type := FAMIXType new name: 'Type'.
	FAMIXInheritance new
		superclass: supertype;
		subclass: type.
	alias := self actualClass new name: 'Alias'.
	alias aliasedType: type.
	subalias := self actualClass new name: 'SubType'.
	FAMIXInheritance new
		subclass: subalias;
		superclass: alias.
	self assert: supertype subclassHierarchy size equals: 3.
	self assert: subalias superclassHierarchy size equals: 3
]
