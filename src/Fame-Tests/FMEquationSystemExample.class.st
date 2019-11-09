Class {
	#name : #FMEquationSystemExample,
	#superclass : #TestCase,
	#instVars : [
		'metaModel'
	],
	#category : #'Fame-Tests'
}

{ #category : #'As yet unclassified' }
FMEquationSystemExample class >> createMetamodel [
	^ FMMetaModelBuilder
		metamodelFrom: {EQCompound . EQEquation . EQEquationSystem . EQExpression . EQIdentifier . EQNumerical . EQOperator . EQSimple . EQVariable}
]

{ #category : #'As yet unclassified' }
FMEquationSystemExample class >> modelString [

^'(
    (EQ.EquationSystem
        (equations
            (EQ.Equation
                (leftHandSide 
                    (EQ.Variable 
                        (identifier (ref: 1))))    
                (rightHandSide 
                    (EQ.Compound 
                        (op (ref: 10))
                        (args (ref: 2) (ref: 3)))))
            (EQ.Equation
                (leftHandSide 
                    (EQ.Variable 
                        (identifier (ref: 2))))    
                (rightHandSide 
                    (EQ.Compound 
                        (op (ref: 10))
                        (args (ref: 5) 
                            (EQ.Compound 
                                (op (ref: 10))
                                (args (ref: 3) (ref: 1)))))))
            (EQ.Equation
                (leftHandSide 
                    (EQ.Variable 
                        (identifier (ref: 3))))    
                (rightHandSide 
                    (EQ.Compound 
                        (op (ref: 10))
                        (args (ref: 5) 
                            (EQ.Compound 
                                (op (ref: 20))
                                (args (ref: 77) (ref: 55)))))))))
    (EQ.Operator (id: 10) (symbol ''+''))
    (EQ.Operator (id: 20) (symbol ''*''))
    (EQ.Identifier (id: 1) (symbol ''X1''))
    (EQ.Identifier (id: 3) (symbol ''X3''))
    (EQ.Identifier (id: 5) (symbol ''X5''))
    (EQ.Identifier (id: 2) (symbol ''X2''))
    (EQ.Numerical (id: 55) (number 5))
    (EQ.Numerical (id: 77) (number 7))                    
)'
]

{ #category : #running }
FMEquationSystemExample >> setUp [
	super setUp.
	metaModel := self class createMetamodel
]

{ #category : #tests }
FMEquationSystemExample >> testAllSubclasses [
	self assert: (metaModel elementNamed: 'EQ.Expression') notNil.
	self assert: (metaModel elementNamed: 'EQ.Expression') allSubclasses size equals: 4
]

{ #category : #tests }
FMEquationSystemExample >> testMetamodel [
	self assert: metaModel elements size equals: 19.
	self assert: metaModel packages size equals: 1.
	self assert: metaModel classes size equals: 9.
	self assert: metaModel properties size equals: 9
]

{ #category : #tests }
FMEquationSystemExample >> testMetamodelContainsCompound [
	self assert: (metaModel elementNamed: 'EQ.Compound') notNil
]

{ #category : #tests }
FMEquationSystemExample >> testPrintString [
	| model systems |
	model := (FMModel withMetamodel: metaModel)
		importString: self class modelString;
		yourself.
	systems := model elements select: [ :e | e isKindOf: EQEquationSystem ].
	self assert: systems size equals: 1.
	self assert: systems anyOne printString equals: 'X1 = (X2 + X3)\X2 = (X5 + (X3 + X1))\X3 = (X5 + (7 * 5))\' withCRs
]
