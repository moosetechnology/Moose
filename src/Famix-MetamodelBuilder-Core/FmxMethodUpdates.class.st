"
Description
--------------------

I represent a change that would update methods of a class during a Famix generation.

Examples
--------------------

	method := RGMethod new
		sourceCode: 'initialize
		<generated>
		super initialize.
		self toto: true;
		protocol: #initialization;
		name: #initialize;
		yourself.

	FmxMethodUpdates className: FmxMethodAddition isClassSide: false rgMethods: {method}
	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rgMethods:		<aCollectionOfRGMethods>		A collection of ring methods to update in a class.

"
Class {
	#name : #FmxMethodUpdates,
	#superclass : #FmxMethodAdditions,
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}
