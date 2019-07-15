Class {
	#name : #GTPPStepToNextNamedProductionAction,
	#superclass : #GTPPDebugAction,
	#instVars : [
		'production'
	],
	#category : #'GT-PetitParserDebugger'
}

{ #category : #private }
GTPPStepToNextNamedProductionAction class >> allParserSuperclassesFor: aClass [
	|  allSuperclasses  |

	allSuperclasses := aClass withAllSuperclasses.
	"Return 2 in the ifAbsent: block so that if PPCompositeParser is not a superclass only the current class is returned"
	^ allSuperclasses copyFrom: 1 to: (allSuperclasses indexOf: PPCompositeParser ifAbsent: [ 2 ]) - 1
		
]

{ #category : #registration }
GTPPStepToNextNamedProductionAction class >> gtToNextProductionActionFor: aDebugger [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>

	^ (self forDebugger: aDebugger)
		production: nil;
		label: 'Next production';
		category: 'Next parser invocation';
		icon: GLMUIThemeExtraIcons glamourousNextProduction;
		order: 195
]

{ #category : #registration }
GTPPStepToNextNamedProductionAction class >> gtToProductionActionFor: aDebugger [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>
	| order allParserSuperclasses showedProductions actions |

	order := 500.
	actions := OrderedCollection new.
	showedProductions := OrderedCollection new.

	(allParserSuperclasses := self allParserSuperclassesFor: aDebugger session rootParser class) do: [ :each |
		| productions |
		productions := (aDebugger productionSelectorsFrom: each) copyWithoutAll: showedProductions.
		showedProductions addAll: productions.
		
		actions addAll: (productions collect: [ :aProduction |
			(self forDebugger: aDebugger)
				production: aProduction;
				label: aProduction asString;
				category: 'Next production', (allParserSuperclasses size = 1 ifTrue:[ '' ] ifFalse:[ ' [', each name, ']']);
				order: (order := order + 1) ]) ].
		
	^ actions 
]

{ #category : #accessing }
GTPPStepToNextNamedProductionAction >> defaultProduction [

	^ nil
]

{ #category : #actions }
GTPPStepToNextNamedProductionAction >> executeAction [
	
	self session 
		stepOverInitialInstructionForContext: self startContext;
		stepToNextProduction: self production fromContext: self startContext
]

{ #category : #accessing }
GTPPStepToNextNamedProductionAction >> production [
	
	^ production ifNil: [ self defaultProduction ]
]

{ #category : #accessing }
GTPPStepToNextNamedProductionAction >> production: anObject [
	
	production := anObject
]
