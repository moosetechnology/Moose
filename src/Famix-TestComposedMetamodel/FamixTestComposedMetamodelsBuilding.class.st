Class {
	#name : #FamixTestComposedMetamodelsBuilding,
	#superclass : #TestCase,
	#instVars : [
		'builder1',
		'builder2',
		'composedBuilder',
		'method',
		'methodNode',
		'binding',
		'env'
	],
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #running }
FamixTestComposedMetamodelsBuilding >> setUp [

	super setUp.

	composedBuilder := FamixMetamodelBuilder new.
	env := FmxMBRingEnvironment for: composedBuilder.
	composedBuilder environment: env.
	composedBuilder configuration	
		prefix: 'TstComposed';
		packageName: 'TstComposed'.	
			
	builder1 := FamixMetamodelBuilder forTesting.
	builder1 environment: env.
	builder1 configuration	
		prefix: 'Tst1';
		packageName: 'Tst1'.	
			
	builder2 := FamixMetamodelBuilder forTesting.
	builder2 environment: env.
	builder2 configuration	
		prefix: 'Tst2';
		packageName: 'Tst2'.	

	method := builder1 newClassNamed: #Method.
	methodNode := builder2 newClassNamed: #MethodNode.
	binding := composedBuilder newClassNamed: #Binding.
	
	builder1 generate.
	builder2 generate.
	
	"reuse the builders for keeping of remote elements"
	builder1 parentBuilder: composedBuilder.
	builder2 parentBuilder: composedBuilder.
	method isRemote: true.
	methodNode isRemote: true.
	


]

{ #category : #running }
FamixTestComposedMetamodelsBuilding >> testOneRemoteToOneNonRemote [

	| source generatedMethod |

	method - binding.
	
	composedBuilder generate.
	builder1 generateRemotes.
	builder2 generateRemotes.

	generatedMethod := ((env ringEnvironment ask classNamed: #Tst1Method) methodNamed: #binding).

	self assert: (generatedMethod sourceCode includesSubstring: '<generated>').
	self assert: (generatedMethod sourceCode includesSubstring: '<MSEProperty: #binding type: #Object>').
	self assert: (generatedMethod sourceCode includesSubstring: 'privateState attributeAt: #binding').
	self assert: generatedMethod package name equals: #TstComposed.

	source := ((env ringEnvironment ask classNamed: #TstComposedBinding) methodNamed: #method) sourceCode.

	self assert:  (source includesSubstring: '<generated>').
	self assert:  (source includesSubstring: '<MSEProperty: #method type: #Object>').
	self assert:  (source includesSubstring: 'privateState attributeAt: #method').
	self assert: generatedMethod package name equals: #TstComposed.
]

{ #category : #running }
FamixTestComposedMetamodelsBuilding >> testOneRemoteToOneRemote [

	| source generatedMethod |

	method - methodNode.
	
	composedBuilder generate.
	builder1 generateRemotes.
	builder2 generateRemotes.

	generatedMethod := ((env ringEnvironment ask classNamed: #Tst1Method) methodNamed: #methodNode).

	self assert: (generatedMethod sourceCode includesSubstring: '<generated>').
	self assert: (generatedMethod sourceCode includesSubstring: '<MSEProperty: #methodNode type: #Object>').
	self assert: (generatedMethod sourceCode includesSubstring: 'privateState attributeAt: #methodNode').
	self assert: generatedMethod package name equals: #TstComposed.

	source := ((env ringEnvironment ask classNamed: #Tst2MethodNode) methodNamed: #method) sourceCode.

	self assert:  (source includesSubstring: '<generated>').
	self assert:  (source includesSubstring: '<MSEProperty: #method type: #Object>').
	self assert:  (source includesSubstring: 'privateState attributeAt: #method').
	self assert: generatedMethod package name equals: #TstComposed.

]
