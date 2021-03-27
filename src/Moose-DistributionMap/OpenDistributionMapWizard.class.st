Class {
	#name : #OpenDistributionMapWizard,
	#superclass : #WizardControl,
	#instVars : [
		'colorCollection',
		'mooseGroup',
		'mooseModel'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #'computing - possible properties' }
OpenDistributionMapWizard >> allPropertySelectorsForElementOfType: aClass [
	"return a list of property selectors that can be applied to instances of aClass."

	"	|result|
	self halt.
	result := (aClass allPropertySelectorsComputableForAtLeastOneElementIn: self mooseModel).
	^ result"

	^ (aClass allProperties collect: #name) asSet asArray
]

{ #category : #accessing }
OpenDistributionMapWizard >> colorCollection [
	
	"return the collection of all the colors that can be selected to display a property value"
	^ colorCollection ifNil: [ colorCollection := OrderedCollection withAll: {Color blue. Color red . Color green . Color brown. Color yellow . Color orange . Color magenta . Color cyan . Color purple . Color pink }]
]

{ #category : #accessing }
OpenDistributionMapWizard >> computeAndReturnDistributionMapElements [

	"both subclasses have a different way compute that. One directly have the corresponding group to return, the other need to compute that from a block parameter"
	^ self subclassResponsibility 
]

{ #category : #accessing }
OpenDistributionMapWizard >> distributionMapElements [

	^ self computeAndReturnDistributionMapElements
]

{ #category : #accessing }
OpenDistributionMapWizard >> groupClass [

	^ self mooseGroup anyOne class
]

{ #category : #'computing possible elements' }
OpenDistributionMapWizard >> groupMetaClasses [
	^ MooseModel meta elements
		select: [ :each | 
			each isFM3Class
				and: [ self groupClass = each implementingClass
						or: [ self groupTraits includes: each implementingClass ] ] ]
]

{ #category : #'computing possible elements' }
OpenDistributionMapWizard >> groupTraits [
	^ self groupClass traits
]

{ #category : #initialization }
OpenDistributionMapWizard >> initializePropertyValuesPane: aWizardPane [
	| dropListPart |
	dropListPart := (DropListPart new)
		list: #(1 2 3 4 5 6 7 8 9 10);
		inGroupboxNamed: 'How many values do you want to display from your property: ';
		defaultValue: 2;
		useLatePopulateContents: false;
		callback: [ :outputValue | 
			aWizardPane removeAllParts.
			aWizardPane row: dropListPart associatedTo: #numberOfProperties.
			self initializePropertyValuesPane: aWizardPane numberOfProp: outputValue].
	aWizardPane row: dropListPart associatedTo: #numberOfProperties
]

{ #category : #initialization }
OpenDistributionMapWizard >> initializePropertyValuesPane: aWizardPane numberOfProp: outputValue [
	1 to: outputValue do: [ :index | 
		aWizardPane
			row: [ :r | 
				r
					column: (self propertyNamePartWithDefault: 'property' , index asString)
					associatedTo: ('property' , index asString , 'Name') asSymbol.
				r
					column: (self propertyValueMapperPartFromIndex: index)
					associatedTo: ('property' , index asString , 'Mapper') asSymbol
					requiring: {#propertySelector . #entitiesToComputeSelector}.
				r
					column: (self propertyColorPartWithDefault: index)
					associatedTo: ('property' , index asString , 'Color') asSymbol ] ].
	aWizardPane
		row: self useColorGradient
		associatedTo: #useColorGradient.
	^ aWizardPane refresh
]

{ #category : #accessing }
OpenDistributionMapWizard >> mooseGroup [

	"return the mooseGroup concerned by the visualization"
	^mooseGroup  
]

{ #category : #accessing }
OpenDistributionMapWizard >> mooseGroup: aMooseGroup [

	"set the mooseGroup concerned by the visualization"
	mooseGroup := aMooseGroup 
]

{ #category : #accessing }
OpenDistributionMapWizard >> mooseModel [
	"return the mooseGroup concerned by the visualization"

	^ mooseModel ifNil: [ mooseModel := self mooseGroup mooseModel ]
]

{ #category : #'accessing - map parameters' }
OpenDistributionMapWizard >> properties [
	
	^ (1 to: (self wizardInformations at: #numberOfProperties)) collect: [:int | self wizardInformations at: {'property',int asString, 'Name'} asSymbol]
]

{ #category : #'accessing - map parameters' }
OpenDistributionMapWizard >> propertyBlockOrSelector [
	^ Smalltalk compiler
		evaluate: (self wizardInformations at: #propertySelector)
]

{ #category : #'accessing - map parameters' }
OpenDistributionMapWizard >> propertyColorMap [
	
	| result  |
	result := Dictionary new.
	1 to: (self wizardInformations at: #numberOfProperties) do: [ :number |
		|propertyValueId|
		propertyValueId := self wizardInformations at: ('property', number asString,'Name') asSymbol.
		result 
				at: propertyValueId 
				put: (self colorCollection at: (self wizardInformations at: ('property',number asString,'Color') asSymbol)).
		].
	
	^ result
]

{ #category : #initialization }
OpenDistributionMapWizard >> propertyColorPartWithDefault: index [
	^ (MorphDropListPart new)
		inGroupboxNamed: 'Color';
		useLatePopulateContents: false;
		list:
				(self colorCollection
						collect: [ :c | 
							(Morph new)
								extent: 80 @ 12;
								color: c ]);
		defaultValue: index;
		yourself
]

{ #category : #initialization }
OpenDistributionMapWizard >> propertyMapperDefaultTextFromIndex: aNumber [
	^ aNumber = 1
		ifTrue: [ self propertyMapperFirstDefaultText ]
		ifFalse: [ self propertyMapperSecondDefaultText ]
]

{ #category : #initialization }
OpenDistributionMapWizard >> propertyMapperFirstDefaultText [

	^ (DistributionMapPropertyInfo fromComputationBlock: self propertyBlockOrSelector andElements: self distributionMapElements) firstDefaultText 
]

{ #category : #initialization }
OpenDistributionMapWizard >> propertyMapperSecondDefaultText [

	^ (DistributionMapPropertyInfo fromComputationBlock: (self propertyBlockOrSelector) andElements: self distributionMapElements) secondDefaultText 
]

{ #category : #initialization }
OpenDistributionMapWizard >> propertyNamePartWithDefault: aString [
	^ (TextFieldPart new)
		inGroupboxNamed: 'Property name';
		useLatePopulateContents: false;
		defaultValue: aString;
		yourself
]

{ #category : #initialization }
OpenDistributionMapWizard >> propertyValueMapperPartFromIndex: index [

	^ (TextFieldPart new)
		inGroupboxNamed: 'Value mapper';
		useLatePopulateContents: false;
		prefix: '[:propVal | ';
		suffix: ' ]';
		defaultValue: [ :requiredInputs | 
					self propertyMapperDefaultTextFromIndex: index ];
		textFieldHorizontalSize: 200;
		yourself
]

{ #category : #'accessing - map parameters' }
OpenDistributionMapWizard >> propertyValuesMap [
	| result |
	result := Dictionary new.
	1 to: (self wizardInformations at: #numberOfProperties) do: [ :int | 
		| blockString propertyValueId |
		propertyValueId := self wizardInformations
			at: ('property' , int asString , 'Name') asSymbol.
		blockString := '[:propVal | '
			,
				(self wizardInformations
					at: ('property' , int asString , 'Mapper') asSymbol) , ']'.
		result
			at: propertyValueId
			put: (Smalltalk compiler evaluate: blockString) ].
	^ result
]

{ #category : #initialization }
OpenDistributionMapWizard >> useColorGradient [
	^ (CheckboxPart new)
		label: 'Use a color gradient';
		defaultValue: false;
		useLatePopulateContents: false;
		yourself
]
