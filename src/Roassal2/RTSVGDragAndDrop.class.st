"
A RTSVGDragAndDrop is the Drag&Drop of SVG elements.

Drag&Drop of edges is NOT supported, but edges connected to dragged elements will move accordingly

"
Class {
	#name : #RTSVGDragAndDrop,
	#superclass : #RTSVGInteraction,
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGDragAndDrop >> addEventHandlers: aStream id: aString element: element center: aNumber [
	aStream
		nextPutAll: 'dragdrop '
]

{ #category : #adding }
RTSVGDragAndDrop >> addFunctions: aStream [
	aStream
		nextPutAll: '				var SVGDocument = null;
		var SVGRoot = null;
		var TrueCoords = null;
		var GrabPoint = null;
		var BackDrop = null;
		var DragTarget = null;
		var Wrapper = null;
		function GADInit(evt)
		{
			SVGDocument = evt.target.ownerDocument;
   		SVGRoot = evt.target;
   		TrueCoords = SVGRoot.createSVGPoint();
   		GrabPoint = SVGRoot.createSVGPoint();
   		BackDrop = SVGDocument.getElementById("BackDrop");
		Wrapper = SVGDocument.getElementById("Wrapper");
		}
		function Grab(evt)
		{
  		if (!evt.target.classList.contains("dragdrop"))
      			return; 
   		var targetElement = evt.target;
   		if ( BackDrop != targetElement )
   		{
      			DragTarget = targetElement;
            Wrapper.appendChild(DragTarget);
      			DragTarget.parentNode.appendChild( DragTarget );
      			DragTarget.setAttributeNS(null, ''pointer-events'', ''none'');
      			var transMatrix = DragTarget.getCTM();
      			GrabPoint.x = TrueCoords.x - Number(transMatrix.e);
      			GrabPoint.y = TrueCoords.y - Number(transMatrix.f);
  		 }
		};

		function Drag(evt)
		{
   		GetTrueCoords(evt);
   		if (DragTarget)
   		{
      			var newX = TrueCoords.x - GrabPoint.x;
      			var newY = TrueCoords.y - GrabPoint.y;
      			DragTarget.setAttributeNS(null, ''transform'', ''translate('' + newX + '','' + newY + '')'');
         var pop = document.getElementById(DragTarget.id + "pop");
            		pop.setAttributeNS(null, ''transform'', ''translate('' + newX + '','' + newY + '')'');
            var lines = document.getElementsByTagName("line");
	     var beziers = document.getElementsByName("bezier[]");
            var match = DragTarget.id.match(/\d+/);
            var idNum = parseInt(match[0], 10);
            var bb = Wrapper.getBBox();
            var centerX = bb.x + (bb.width / 2);
            var centerY = bb.y + (bb.height / 2);
            for(var i = 0; i < lines.length; i++) 
            {
              var p1 = lines[i].id.substring(4,lines[i].id.indexOf("_"));
              var p2 = lines[i].id.substring(lines[i].id.indexOf("_")+1);
              if (p1 == "" + idNum) 
              {
                lines[i].setAttributeNS(null, ''x1'', centerX);
                lines[i].setAttributeNS(null, ''y1'', centerY);
              }
              else if (p2 == "" + idNum) 
              {
                lines[i].setAttributeNS(null, ''x2'', centerX);
                lines[i].setAttributeNS(null, ''y2'', centerY);
              }
            }
            for(var j =0; j < beziers.length; j++) 
            {
              var p1 = beziers[j].id.substring(6,beziers[j].id.indexOf("_"));
              var p2 = beziers[j].id.substring(beziers[j].id.indexOf("_")+1);
              var split = beziers[j].getAttribute(''d'').split(" ");
              if (p1 == "" + idNum) 
              {
                split.shift();
                beziers[j].setAttributeNS(null, ''d'', "M"+centerX+","+centerY+" "+split.join(" "));
              }
              else if (p2 == "" + idNum) 
              {
                var pref = "";
                if (split[split.length-1].charAt(0) == ''L'')
                  pref = "L";
                split.pop();
                beziers[j].setAttributeNS(null, ''d'', split.join(" ")+" "+pref+centerX+","+centerY);
              }                            
            }
   		}
		};

		function Drop(evt)
		{
   		if ( DragTarget )
   		{
     		  var targetElement = evt.target;
      		DragTarget.setAttributeNS(null, ''pointer-events'', ''all'');
          Wrapper.removeChild(DragTarget);
          Wrapper.parentNode.appendChild(DragTarget);
      		DragTarget = null;
   		}
		};

		function GetTrueCoords(evt)
		{
		if (SVGRoot == null)
			return; 		
   		var newScale = SVGRoot.currentScale;
   		var translation = SVGRoot.currentTranslate;
   		TrueCoords.x = (evt.clientX - translation.x)/newScale;
   		TrueCoords.y = (evt.clientY - translation.y)/newScale;
		};
'
]

{ #category : #adding }
RTSVGDragAndDrop >> addGlobalHandlers: aStream [
	aStream
		nextPutAll: '
	onload="GADInit(evt)"
	onmousedown="Grab(evt)"
	onmousemove="Drag(evt)"
	onmouseup="Drop(evt)"
'
]

{ #category : #initialization }
RTSVGDragAndDrop >> initialize [
	super initialize.
	contained := true.
	external := false.
	self type: 'draganddrop'.
]
