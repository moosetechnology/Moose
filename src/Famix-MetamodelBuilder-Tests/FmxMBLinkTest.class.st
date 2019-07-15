Class {
	#name : #FmxMBLinkTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'access',
		'variable',
		'method'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBLinkTest >> setUp [

	super setUp.
	
	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	
	method := builder newClassNamed: #Method.	
]

{ #category : #tests }
FmxMBLinkTest >> testLinkWithAliases [

	| sides |
	
	sides := (method as: #TWithAccesses)
		link: #accesses -> #accessor
		throughAssociation: (access as: #TAccess) 
		link: #variable <- #icomingAcesses
		with: (variable as: #TAccessible).
		
	sides first comment: 'This is a comment'.
		
	builder generate.
	
	"TODO: assert"
]
