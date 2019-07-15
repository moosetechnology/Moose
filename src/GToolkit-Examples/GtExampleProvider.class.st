"
I am a superclass for classes whose main goal is to provide  examples. I only use the trait TGtExampleAssertable to provide subclasses with assertions that can be used within examples.

Classes providing examples do not have to subclass me. I am only here for convenience. Classes providing examples can use themselves TGtExampleAssertable or they can implement their own assertion methods.
"
Class {
	#name : #GtExampleProvider,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#instVars : [
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}
