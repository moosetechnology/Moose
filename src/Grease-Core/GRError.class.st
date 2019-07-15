"
This class provides consistent initialization and exception signaling behaviour across platforms. All platforms must provide the ANSI-standard signaling protocol on this class. #signal: can therefore be safely called on any subclass.

Packages that are using Seaside-Platform should usually subclass GRError instead of Error.
"
Class {
	#name : #GRError,
	#superclass : #Error,
	#category : #'Grease-Core-Exceptions'
}
