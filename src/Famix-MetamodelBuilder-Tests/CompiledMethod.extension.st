Extension { #name : #CompiledMethod }

{ #category : #'*Famix-MetamodelBuilder-Tests' }
CompiledMethod >> isEquivalentToGeneratedMethodOfTrait [
	"To know if a method is equivalent to one generated in a trait, we look if the trait composition have the method. If it has it, we take its AST, remove the generated pragma and compare the AST to the one of the receiver."

	| traitMethodAST |
	traitMethodAST := (self methodClass traitComposition compiledMethodAt: self selector ifAbsent: [ ^ false ]) ast copy.
	(traitMethodAST pragmaNamed: #generated ifAbsent: [ ^ false ]) removeFromTree.
	^ traitMethodAST = self ast
]
