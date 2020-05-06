Class {
	#name : #FAMIXLintRuleTest,
	#superclass : #TestCase,
	#category : #'Moose-Core-Tests'
}

{ #category : #tests }
FAMIXLintRuleTest >> testRules [
	{FAMIXMetaModelClassesNotDeclaredInFameRule . FAMIXMetaModelClassesShouldNotOverrideRule} do: [ :rule | RBSmalllintChecker runRule: rule new ]
]
