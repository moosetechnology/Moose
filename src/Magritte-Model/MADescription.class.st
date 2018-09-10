"
I am the root of the description hierarchy in Magritte and I provide most of the basic properties available to all descriptions. If you would like to annotate your model with a description have a look at the different subclasses of myself.

!Example
If your model has an instance variable called ==title== that should be used to store the title of the object, you could add the following description to your class:

=Document class>>descriptionTitle
=	^ MAStringDescription new
=		autoAccessor: #title;
=		label: 'Title';
=		priority: 20;
=		beRequired;
=		yourself.

The selector ==#title== is the name of the accessor method used by Magritte to retrieve the value from the model. In the above case Magritte creates the accessor method and the instance variable automatically, if necessary. The label is used to give the field a name and will be printed next to the input box if a visual GUI is created from this description.

The write-accessor is automatically deduced by adding a colon to the read-selector, in this example ==#title:==. You can specify your own accessor strategy using one of the subclasses of ==*MAAccessor*==. If you have multiple description within the same object, the ==#priority:== field is used to order them. Assign a low priority to have descriptions traversed first.
"
Class {
	#name : #MADescription,
	#superclass : #MAObject,
	#instVars : [
		'accessor'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MADescription class >> defaultAccessor [
	^ MANullAccessor new
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultComment [
	^ nil
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultConditions [
	^ Array new
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultDefault [
	^ nil
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultGroup [
	^ nil
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultKind [
	^ Object
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultLabel [
	^ String new
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultPersistent [
	^ true
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultPriority [
	^ 0
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultReadonly [
	^ false
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultRequired [
	^ false
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultStringReader [
	^ MAStringReader
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultStringWriter [
	^ MAStringWriter
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultUndefined [
	^ String new
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultValidator [
	^ MAValidatorVisitor
]

{ #category : #'accessing-defaults' }
MADescription class >> defaultVisible [
	^ true
]

{ #category : #'as yet unclassified' }
MADescription class >> defaultVisibleInReport [
	^true
]

{ #category : #'accessing-examples' }
MADescription class >> grouping [
	^ MADescriptionHolder groupOf: self
]

{ #category : #operators }
MADescription >> , aDescription [
	"Concatenate the receiver and ==aDescription== to one composed description. Answer a description container containing both descriptions."

	^ self asContainer copy
		addAll: aDescription asContainer;
		yourself
]

{ #category : #operators }
MADescription >> <= anObject [
	"Answer whether the receiver should precede ==anObject== in a priority container."

	^ self priority <= anObject priority
]

{ #category : #comparing }
MADescription >> = anObject [
	^ super = anObject
		and: [ self accessor = anObject accessor ]
]

{ #category : #visiting }
MADescription >> acceptMagritte: aVisitor [
	aVisitor visitDescription: self
]

{ #category : #accessing }
MADescription >> accessor [
	"Answer the access-strategy of the model-value described by the receiver."

	^ accessor ifNil: [ accessor := self class defaultAccessor ]
]

{ #category : #accessing }
MADescription >> accessor: anObject [
	accessor := anObject asAccessor
]

{ #category : #validation }
MADescription >> addCondition: aCondition [ 
	self 
		addCondition: aCondition
		labelled: aCondition greaseString
]

{ #category : #validation }
MADescription >> addCondition: aCondition labelled: aString [
	"Add ==aCondition== as an additional validation condition to the receiver and give it the label ==aString==. The first argument is either a block-context or any other object that responds to ==#value:== with ==true== or ==false==."

	self conditions: (self conditions
		copyWith: (Association
			key: aCondition
			value: aString))
]

{ #category : #converting }
MADescription >> asContainer [
	"Answer a description container of the receiver."

	self subclassResponsibility
]

{ #category : #actions }
MADescription >> beHidden [
	self visible: false
]

{ #category : #actions }
MADescription >> beOptional [
	self required: false
]

{ #category : #actions }
MADescription >> beReadonly [
	self readonly: true
]

{ #category : #actions }
MADescription >> beRequired [
	self required: true
]

{ #category : #actions }
MADescription >> beVisible [
	self visible: true
]

{ #category : #actions }
MADescription >> beWriteable [
	self readonly: false
]

{ #category : #builder }
MADescription >> canExpand [
	" used to expand a relation description into a group "
	^self propertyAt: #canExpand ifAbsent: [ self defaultCanExpand ]
]

{ #category : #builder }
MADescription >> canExpand: aBoolean [
	" used to expand a relation description into a group "
	^self propertyAt: #canExpand put: aBoolean
]

{ #category : #accessors }
MADescription >> chainAccessor: anArray [
	"Uses ==anArray== of selectors to read from the model."

	self accessor: (MAChainAccessor accessors: anArray)
]

{ #category : #'accessing-properties' }
MADescription >> comment [
	"Answer a comment or help-text giving a hint what this description is used for. GUIs that are built from this description might display it as a tool-tip."

	^ self propertyAt: #comment ifAbsent: [ self class defaultComment ]
]

{ #category : #'accessing-properties' }
MADescription >> comment: aString [
	self propertyAt: #comment put: aString
]

{ #category : #'accessing-properties' }
MADescription >> conditions [
	"Answer a collection of additional conditions that need to be fulfilled so that the described model is valid. Internally the collection associates conditions with an error string."

	^ self propertyAt: #conditions ifAbsent: [ self class defaultConditions ]
]

{ #category : #'accessing-properties' }
MADescription >> conditions: anArray [
	self propertyAt: #conditions put: anArray
]

{ #category : #'accessing-messages' }
MADescription >> conflictErrorMessage [
	^ self propertyAt: #conflictErrorMessage ifAbsent: [ 'Input is conflicting with concurrent modification' ]
]

{ #category : #'accessing-messages' }
MADescription >> conflictErrorMessage: aString [
	self propertyAt: #conflictErrorMessage put: aString
]

{ #category : #accessing }
MADescription >> default [
	^ nil
]

{ #category : #accessing }
MADescription >> default: anObject [
]

{ #category : #builder }
MADescription >> defaultCanExpand [
	" used to expand a relation description into a group "
	self isVisible ifFalse: [ ^false ].
	self isReadonly ifTrue: [ ^false ].
	self tabDisplay ifTrue: [ ^false ].
	self group ifNotNil: [ ^false ].
	^true
]

{ #category : #'owning object' }
MADescription >> describedObject [
	^ MADynamicDescribedObject value
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionComment [
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #comment;
		label: 'Comment';
		priority: 110;
		default: self class defaultComment;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionDefault [
	<magritteDescription>
	^ self class isAbstract
		ifFalse: [ 
			self class new
				accessor: #default;
				label: 'Default';
				priority: 130;
				default: self class defaultDefault;
				yourself ]
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionGroup [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #group;
		default: self class defaultGroup;
		label: 'Group';
		priority: 105;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionLabel [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #label;
		label: 'Label';
		priority: 100;
		default: self class defaultLabel;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionName [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #name;
		label: 'Kind';
		priority: 0;
		beReadonly;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionPriority [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #priority;
		label: 'Priority';
		priority: 130;
		default: self class defaultPriority;
		beRequired;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionReadonly [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #readonly;
		label: 'Readonly';
		priority: 200;
		default: self class defaultReadonly;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionRequired [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #required;
		label: 'Required';
		priority: 220;
		default: self class defaultRequired;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionStringReader [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #stringReader;
		label: 'String Reader';
		priority: 300;
		default: self class defaultStringReader;
		options: self class defaultStringReader withAllSubclasses;
		reference: MAClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionStringWriter [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #stringWriter;
		label: 'String Writer';
		priority: 310;
		default: self class defaultStringWriter;
		options: self class defaultStringWriter withAllSubclasses;
		reference: MAClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionUndefined [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #undefined;
		label: 'Undefined String';
		priority: 140;
		default: self class defaultUndefined;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionValidator [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #validator;
		label: 'Validator';
		priority: 250;
		default: self class defaultValidator;
		options: self class defaultValidator withAllSubclasses;
		reference: MAClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
MADescription >> descriptionVisible [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #visible;
		label: 'Visible';
		priority: 210;
		default: self class defaultVisible;
		yourself
]

{ #category : #strings }
MADescription >> fromString: aString [
	"Answer an object being parsed from ==aString==."

	^ self fromString: aString reader: self stringReader
]

{ #category : #strings }
MADescription >> fromString: aString reader: aParser [
	"Answer an object being parsed from ==aString== using ==aParser==."

	^ aParser read: aString readStream description: self
]

{ #category : #strings }
MADescription >> fromStringCollection: aCollection [
	"Answer a collection of objects being parsed from ==aCollection== of strings."

	^ self fromStringCollection: aCollection reader: self stringReader
]

{ #category : #strings }
MADescription >> fromStringCollection: aCollection reader: aParser [
	"Answer a collection of objects being parsed from ==aCollection== of strings using ==aParser==."

	^ aCollection collect: [ :each | self fromString: each reader: aParser ]
]

{ #category : #'accessing-properties' }
MADescription >> group [
	"Answer the group of the receiving description. The group is a string used to categorize and group descriptions. Certain display interpreters with be able to use this information to improve the usability."

	^ self propertyAt: #group ifAbsent: [ self class defaultGroup ]
]

{ #category : #'accessing-properties' }
MADescription >> group: aString [
	"Answer the group of the receiving description. The group is a string used to categorize and group descriptions. Certain display interpreters with be able to use this information to improve the usability."

	self propertyAt: #group put: aString
]

{ #category : #testing }
MADescription >> hasChildren [
	"Answer ==true== if the receiver has any child-descriptions. A description container usually has children."

	^ false
]

{ #category : #testing }
MADescription >> hasComment [
	"Answer ==true== if the the receiver has got a non empty comment."

	^ self comment notNil and: [ self comment isEmpty not ]
]

{ #category : #testing }
MADescription >> hasLabel [
	"Answer ==true== if the the receiver has got a non empty label."

	^ self label notNil and: [ self label isEmpty not ]
]

{ #category : #comparing }
MADescription >> hash [
	^ super hash bitXor: self accessor hash
]

{ #category : #testing }
MADescription >> isContainer [
	"Answer ==true== if the receiver is a description container."

	^ false
]

{ #category : #testing }
MADescription >> isDescription [
	"Answer ==true== if the receiver is a description."

	^ true
]

{ #category : #testing }
MADescription >> isGrouped [
	^ false
]

{ #category : #accessing }
MADescription >> isKindDefined [
	^ self propertyAt: #kind ifPresent: [ :theKind | true] ifAbsent: [ false ]
]

{ #category : #testing }
MADescription >> isReadonly [
	^ self readonly
]

{ #category : #testing }
MADescription >> isRequired [
	^ self required
]

{ #category : #validation }
MADescription >> isSatisfiedBy: anObject [
	"Answer ==true== if ==anObject== is a valid instance of the receiver's description."

	[ self validate: anObject ]
		on: MAValidationError
		do: [ :err | ^ false ].
	^ true
]

{ #category : #testing }
MADescription >> isSortable [
	"Answer ==true== if the described object can be trivially sorted, e.g. it answers to #<=."

	^ false
]

{ #category : #testing }
MADescription >> isVisible [
	^ self visible
]

{ #category : #accessing }
MADescription >> kind [
	"Answer the base-class (type) the receiver is describing. The default implementation answers the most generic class: Object, the root of the Smalltalk class hierarchy. Subclasses might refine this choice."

	^ self propertyAt: #kind ifAbsent: [ self class defaultKind ]
]

{ #category : #accessing }
MADescription >> kind: aClass [
	self propertyAt: #kind put: aClass
]

{ #category : #'accessing-messages' }
MADescription >> kindErrorMessage [
	^ self propertyAt: #kindErrorMessage ifAbsent: [ 'Invalid input given' ]
]

{ #category : #'accessing-messages' }
MADescription >> kindErrorMessage: aString [
	self propertyAt: #kindErrorMessage put: aString
]

{ #category : #'accessing-properties' }
MADescription >> label [
	"Answer the label of the receiving description. The label is mostly used as an identifier that is printed next to the input field when building a GUI from the receiver."

	^ self propertyAt: #label ifAbsent: [ self class defaultLabel ]
]

{ #category : #'accessing-properties' }
MADescription >> label: aString [
	self propertyAt: #label put: aString
]

{ #category : #'accessing-messages' }
MADescription >> multipleErrorsMessage [
	^ self propertyAt: #multipleErrorsMessage ifAbsent: [ 'Multiple errors' ]
]

{ #category : #'accessing-messages' }
MADescription >> multipleErrorsMessage: aString [
	self propertyAt: #multipleErrorsMessage put: aString
]

{ #category : #'accessing-configuration' }
MADescription >> name [
	"Answer the name of the description, a human-readable string describing the type."

	^ self class label
]

{ #category : #copying }
MADescription >> postCopy [
	super postCopy.
	accessor := accessor copy
]

{ #category : #printing }
MADescription >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' label: '; print: self label.
	aStream nextPutAll: ' comment: '; print: self comment
]

{ #category : #'accessing-properties' }
MADescription >> priority [
	"Answer a number that is the priority of the receiving description. Priorities are used to give descriptions an explicit order by sorting them according to this number."

	^ self propertyAt: #priority ifAbsent: [ self class defaultPriority ]
]

{ #category : #'accessing-properties' }
MADescription >> priority: aNumber [
	self propertyAt: #priority put: aNumber
]

{ #category : #accessors }
MADescription >> propertyAccessor: aSelector [
	"Uses ==aSelector== to read from the property dictionary of the model."

	self accessor: ((MAChainAccessor on: #properties) 
		accessor: (MADictionaryAccessor key: aSelector))
]

{ #category : #convenience }
MADescription >> read: aModel [

	^ self accessor read: aModel
]

{ #category : #'accessing-properties' }
MADescription >> readonly [
	"Answer ==true== if the model described by the receiver is read-only."

	^ self propertyAt: #readonly ifAbsent: [ self class defaultReadonly ]
]

{ #category : #'accessing-properties' }
MADescription >> readonly: aBoolean [
	self propertyAt: #readonly put: aBoolean
]

{ #category : #'accessing-properties' }
MADescription >> required [
	"Answer ==true== if the model described by the receiver is required, this is it cannot be ==nil==."

	^ self propertyAt: #required ifAbsent: [ self class defaultRequired ]
]

{ #category : #'accessing-properties' }
MADescription >> required: aBoolean [
	self propertyAt: #required put: aBoolean
]

{ #category : #'accessing-messages' }
MADescription >> requiredErrorMessage [
	^ self propertyAt: #requiredErrorMessage ifAbsent: [ 'Input is required but no input given' ]
]

{ #category : #'accessing-messages' }
MADescription >> requiredErrorMessage: aString [
	self propertyAt: #requiredErrorMessage put: aString
]

{ #category : #accessors }
MADescription >> selectorAccessor: aSelector [
	"Uses ==aSelector== to read from the model."

	self accessor: (MASelectorAccessor selector: aSelector)
]

{ #category : #'accessing-strings' }
MADescription >> stringReader [
	"Answer a Visitor that can be used to parse the model described by the receiver from a string."

	^ self propertyAt: #stringReader ifAbsent: [ self class defaultStringReader ]
]

{ #category : #'accessing-strings' }
MADescription >> stringReader: aClass [
	self propertyAt: #stringReader put: aClass
]

{ #category : #'accessing-strings' }
MADescription >> stringWriter [
	"Answer a Visitor that can be used to convert the model described by the receiver to a string."

	^ self propertyAt: #stringWriter ifAbsent: [ self class defaultStringWriter ]
]

{ #category : #'accessing-strings' }
MADescription >> stringWriter: aClass [
	self propertyAt: #stringWriter put: aClass
]

{ #category : #strings }
MADescription >> toString: anObject [
	"Answer a string being formatted from ==anObject==."

	^ self toString: anObject writer: self stringWriter
]

{ #category : #strings }
MADescription >> toString: anObject writer: aFormatter [
	"Answer a string being formatted from ==anObject== using ==aFormatter==."

	^ aFormatter write: anObject description: self
]

{ #category : #strings }
MADescription >> toStringCollection: aCollection [
	"Answer a collection of strings being formatted from ==aCollection==."

	^ self toStringCollection: aCollection writer: self stringWriter
]

{ #category : #strings }
MADescription >> toStringCollection: aCollection writer: aFormatter [
	"Answer a collection of strings being formatted from ==aCollection== using ==aFormatter==."

	^ aCollection collect: [ :each | self toString: each writer: aFormatter ]
]

{ #category : #'accessing-strings' }
MADescription >> undefined [
	"Answer a string that is printed whenever the model described by the receiver is ==nil==."

	^ (self propertyAt: #undefined ifAbsent: [ self class defaultUndefined ])
		ifNil: [ self class defaultUndefined ]
]

{ #category : #'accessing-strings' }
MADescription >> undefined: aString [
	self propertyAt: #undefined put: aString
]

{ #category : #validation }
MADescription >> validate: anObject [
	"Validate ==anObject== in the context of the describing-receiver, raises an error in case of a problem. If ==anObject== is ==nil== and not required, most tests will be skipped. Do not override this message, instead have a look at ==#validateSpecific:== what is usually a better place to define the behaviour your description requires."

	self validator on: anObject description: self
]

{ #category : #'validation-private' }
MADescription >> validateConditions: anObject [
	"Validate ==anObject== to satisfy all its custom conditions."

	self conditions do: [ :each |
		(each key value: anObject)
			ifFalse: [ MAConditionError description: self signal: each value ] ]
]

{ #category : #'validation-private' }
MADescription >> validateKind: anObject [
	"Validate ==anObject== to be of the right kind."

	(anObject isKindOf: self kind)
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]
]

{ #category : #'validation-private' }
MADescription >> validateRequired: anObject [
	"Validate ==anObject== not to be ==nil== if it is required."

	(self isRequired and: [ anObject isNil ])
		ifTrue: [ MARequiredError description: self signal: self requiredErrorMessage ]
]

{ #category : #'validation-private' }
MADescription >> validateSpecific: anObject [
	"Validate ==anObject== to satisfy its descriptions specific validation rules. Subclasses mostly want to override this method."
]

{ #category : #'accessing-properties' }
MADescription >> validator [
	"Answer a Visitor that can be used to validate the model described by the receiver."

	^ self propertyAt: #validator ifAbsent: [ self class defaultValidator ]
]

{ #category : #'accessing-properties' }
MADescription >> validator: aClass [
	self propertyAt: #validator put: aClass
]

{ #category : #'accessing-properties' }
MADescription >> visible [
	"Answer ==true== if the model described by the receiver is visible, as an opposite to hidden."

	^ self propertyAt: #visible ifAbsent: [ self class defaultVisible ]
]

{ #category : #'accessing-properties' }
MADescription >> visible: aBoolean [
	self propertyAt: #visible put: aBoolean
]

{ #category : #'accessing-properties' }
MADescription >> visibleInReport [

	^self propertyAt: #visibleInReport ifAbsent: [ self class defaultVisibleInReport ]
]

{ #category : #'accessing-properties' }
MADescription >> visibleInReport: aBoolean [ 
	self propertyAt: #visibleInReport put: aBoolean
]
