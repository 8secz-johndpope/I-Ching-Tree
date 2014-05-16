// this file is just showing the ActionScript code inside the Flash file

function ichingHexagram(hexCode) {
	_root.attachMovie("hexagram", "hexagram", 200);
	thisHexagram = _root.hexagram;
	thisHexagram._y = 100;
	thisHexagram._x = 400;
	
	if (hexCode == "" || hexCode == Nan) {
		// random hexagram
		trace ("hexBuild1");
		hex = [];
		var ySegment = -50;
		for (i=0;i<6;i++) {
			var count = 0;
			for (j=0;j<3;j++) {
				r = random(2);
				if (r == 0) {
					count = count + 3;
				} else if (r == 1) {
					count = count + 2;
				}
			}
			if (count%2) { // if odd
				hex[i] = 1; 
				_root.hexagram.attachMovie("YANG", "line"+i, 200+i);
			} else {
				hex[i] = 0; 
				_root.hexagram.attachMovie("YIN", "line"+i, 200+i);
			}
			thisLine = _root.hexagram["line"+i];
			thisLine._y = ySegment;
			thisLine._x = 0;
			ySegment += 20;
		}
		hexCode = "";
		triGramUpperCode = "";
		triGramLowerCode = "";
		for (k=0;k<3;k++) {
			triGramUpperCode = triGramUpperCode + hex[k];
		}
			for (k=3;k<6;k++) {
		triGramLowerCode = triGramLowerCode + hex[k];
		}
		hexCode = triGramUpperCode + triGramLowerCode;
		trace ("triGramUpperCode = " + triGramUpperCode);
		trace ("triGramLowerCode = " + triGramLowerCode);
		trace ("hexCode = " + hexCode);
	
	} else {
	
		// - build hexagram from hexCode
		trace ("hexBuild2");
		trace ("hexCode = " + hexCode);
		var ySegment = -50;
		for (i=0;i<6;i++) {
			if (hexCode.charAt(i) == "1") { 
				_root.hexagram.attachMovie("YANG", "line"+i, 200+i);
			} else {
				_root.hexagram.attachMovie("YIN", "line"+i, 200+i);
			}
			thisLine = _root.hexagram["line"+i];
			thisLine._y = ySegment;
			thisLine._x = 0;
			ySegment += 20;
		}
	}
	thisHexagram.hexCode = hexCode;
	grope2(hexCode);
}

ichingHexagram();

button1.onRelease = function () {
     _root.ichingHexagram();
};
button2.onRelease = function () {
	input = _root.inputWin.text;
     _root.ichingHexagram(input);
};


function grope1(hexCode) {
	_root.attachMovie("fractal_tree", "fractal_tree", 10);
	thisFractal = _root.fractal_tree;
	thisFractal._y = 100;
	thisFractal._x = 400;
	
	// - build fractal from hexCode
		var ySegment = 0;
		var xSegment = 0;
		var size = 100;
		var transparency = 100;
		
		for (i=0;i<6;i++) {
			_root.fractal_tree.attachMovie("groper", "groper"+i, i+11);
			thisGroper = _root.fractal_tree["groper"+i];
			thisGroper._y = ySegment;
			thisGroper._x = xSegment;
			thisGroper._xscale = size;
			thisGroper._yscale = size;
			thisGroper._alpha = transparency;
	
			if (hexCode.charAt(i) == "1") { 
				thisGroper._rotation = -37;
				xSegment += 20;
			} else {
				thisGroper._rotation = 37;
				xSegment -= 20;
			}
			ySegment += 20;
			size *= 1.618;
			transparency *= 0.618;
		}
}

function grope2(hexCode) {
	_root.attachMovie("fractal_tree_grid", "fractal_tree_grid", 100);
	thisFractal = _root.fractal_tree_grid;
	thisFractal._y = 230;
	thisFractal._x = 400;
	//_root.fractal_tree_grid.attachMovie("node", "node00", 101);
	//mainNode = _root.fractal_tree.node00;
	
	// - build fractal from hexCode
		var ySegment = 0;
		var xPosition = 0;
		var yInterval = 100;
		var xInterval = 100;
		var size = 100;
		var transparency = 100;
		
		for (i=0;i<6;i++) {
			_root.fractal_tree_grid.attachMovie("line", "line"+i, i+110);
			thisNode = _root.fractal_tree_grid["line"+i];
			
			thisNode._xscale = size;
			thisNode._yscale = size;
			
			thisNode._y = ySegment;
			thisNode._x = xPosition;
			
			if (hexCode.charAt(i) == "1") { 
				xPosition += xInterval;
				thisNode._rotation = 0;
			} else {
				xPosition -= xInterval;
				thisNode._rotation = 90;
			}
			
			size *= 0.618;
			ySegment += yInterval;
			
			yInterval *= 0.618;
			xInterval *= 0.618;
			
		}
}
	

// first run:
// 101110 = "#50 Ting : The Caldron"

iching = new Object();

iching.hexagram1.number = 1;
iching.hexagram1.nameTitle1 = "Ch'ien";
iching.hexagram1.nameTitle2 = "The Creative";


		
			