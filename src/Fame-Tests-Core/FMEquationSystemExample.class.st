Class {
	#name : #FMEquationSystemExample,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #'As yet unclassified' }
FMEquationSystemExample class >> createMetamodel [
	| builder |
	builder := FMPragmaProcessor new.
	builder queue: (OrderedCollection new
		add: EQCompound;
		add:  EQEquation;
		add:  EQEquationSystem;
		add:  EQExpression;
		add: EQIdentifier;
		add:  EQNumerical;
		add:  EQOperator;
		add:  EQSimple;
		add:  EQVariable; 
		yourself).
	builder run.
	^builder asMetamodel 

]

{ #category : #'As yet unclassified' }
FMEquationSystemExample class >> createModel [

	| metarepo repo importer |
	metarepo := self createMetamodel.
	repo := FMRepository with: metarepo.
	importer := FMImporter new. 
	importer repository: repo. 
	importer importString: self modelString.
	^repo


	"((	self createModel 	))"
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
FMEquationSystemExample >> testAllSubclasses [
	| metarepo |
	metarepo := self class createMetamodel.
	(metarepo elementNamed: 'EQ.Expression') notNil should beTrue.
	(metarepo elementNamed: 'EQ.Expression') allSubclasses size should = 4
]

{ #category : #running }
FMEquationSystemExample >> testCreateModel [

	| metarepo repo |
	metarepo := self class createMetamodel.
	repo := FMRepository with: metarepo.
	repo importString: self class modelString.
	^repo
]

{ #category : #running }
FMEquationSystemExample >> testMetamodel [
	| metarepo |
	metarepo := self class createMetamodel.
	metarepo elements size should = 19.
	metarepo packages size should = 1.
	metarepo classes size should = 9.
	metarepo properties size should = 9
]

{ #category : #running }
FMEquationSystemExample >> testMetamodelContainsCompound [
	| metarepo |
	metarepo := self class createMetamodel.
	(metarepo elementNamed: 'EQ.Compound') notNil should beTrue
]

{ #category : #running }
FMEquationSystemExample >> testPrintString [
	| repo systems |
	repo := self testCreateModel.
	systems := repo selectKindOf: EQEquationSystem.
	systems size should = 1.
	systems anyOne printString should = 'X1 = (X2 + X3)\X2 = (X5 + (X3 + X1))\X3 = (X5 + (7 * 5))\' withCRs
]
