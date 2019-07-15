Class {
	#name : #FmxMBTypedPropertyTest,
	#superclass : #FmxMBPropertyTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBTypedPropertyTest >> testDoubleQuotesInPropertyComment [

	"test a case when the property comment contains doubled quotes"
	
	| simpleClass commentString generated |
	
	simpleClass := builder newClassNamed: #Comment.
	commentString := 'operator''s symbol'.

	(simpleClass property: #operator type: #String) comment: commentString.

	simpleClass comment: commentString.
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: (generated selectors includesAll: #(operator operator:))



]

{ #category : #tests }
FmxMBTypedPropertyTest >> testMultivalued [

	"test if typed properties can be multivalued"

	| aClass simpleProperty multivaluedProperty |
	
	aClass := builder newClassNamed: #SomeClass.
	simpleProperty := (aClass property: #simple type: #Object).
	multivaluedProperty := (aClass property: #multi type: #Object) multivalued.

	self deny: simpleProperty isMultivalued.
	self assert: multivaluedProperty isMultivalued.
	
	"swap and test again"

	simpleProperty multivalued: true.
	multivaluedProperty multivalued: false.	

	self assert: simpleProperty isMultivalued.
	self deny: multivaluedProperty isMultivalued.

]
