Class {
	#name : #FmxMBClassAliasTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBClassAliasTest >> testLinkTo [

	| class method package env project bundle |
	
	builder := FamixGenerator builderWithDefinitions.
	builder beForTesting.
		
	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	bundle := builder newClassNamed: #Bundle.    
	        
    (package asExisting: #TPackage)
        link: #childEntities to: method;
        link: #packageOwner to: bundle.
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) traitComposition traits collect: #name) asArray equals: #(FamixTPackage).
	self assert: ((env ask classNamed: #TstMethod) traitComposition traits collect: #name) asArray equals: #(FamixTPackageable).
	self assert: ((env ask classNamed: #TstBundle) traitComposition traits collect: #name) asArray equals: #(FamixTWithPackages).

]

{ #category : #tests }
FmxMBClassAliasTest >> testRelateEntity [

	| class alias |
		
	class := builder newClassNamed: #Variable.	
	
	alias := class as: #TVariable.
	
	self assert: alias relatedEntity isMetamodelTrait.
	self assert: alias relatedEntityName equals: #TVariable.
]
