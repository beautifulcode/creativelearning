// Creative Learning Javascripts

// --------------------------------------------------------------------

//						General Functions

//---------------------------------------------------------------------



// Determine browser
	var isMinIE5 = (navigator.appVersion.indexOf("5.")) >= 0 ? 1 : 0;
	var isDOM = (document.getElementById) ? 1 : 0;


// Place focus on first form element
	function initFocus(){
		 var firstElem = document.forms(0).item(0);
		 if (! firstElem) { return; }
		 firstElem.focus();
		}


// Alter background color of elements
	function changeBG(objId,color) {
		if (isMinIE5||isDOM) {
			document.getElementById(objId).style.backgroundColor=color;
		} else {
			return;
		}
	}

// Alter border of elements
	function changeBorder(objId,color) {
		if (isMinIE5||isDOM) {
			document.getElementById(objId).style.borderColor=color;
		} else {
			return;
		}
	}
	
// --------------------------------------------------------------------

//						Stripe Table Function
//						from David F. Miller

//---------------------------------------------------------------------
	
	
	// this function is needed to work around 
  // a bug in IE related to element attributes
  function hasClass(obj) {
     var result = false;
     if (obj.getAttributeNode("class") != null) {
         result = obj.getAttributeNode("class").value;
     }
     return result;
  }   

 function stripe(id) {

    // the flag we'll use to keep track of 
    // whether the current row is odd or even
    var even = false;
  
    // if arguments are provided to specify the colours
    // of the even & odd rows, then use the them;
    // otherwise use the following defaults:
    var evenColor = arguments[1] ? arguments[1] : "#fff";
    var oddColor = arguments[2] ? arguments[2] : "#eee";
  
    // obtain a reference to the desired table
    // if no such table exists, abort
    var table = document.getElementById(id);
    if (! table) { return; }
    
    // by definition, tables can have more than one tbody
    // element, so we'll have to get the list of child
    // &lt;tbody&gt;s 
    var tbodies = table.getElementsByTagName("tbody");

    // and iterate through them...
    for (var h = 0; h < tbodies.length; h++) {
    
     // find all the &lt;tr&gt; elements... 
      var trs = tbodies[h].getElementsByTagName("tr");
      
      // ... and iterate through them
      for (var i = 0; i < trs.length; i++) {

        // avoid rows that have a class attribute
        // or backgroundColor style
        if (! hasClass(trs[i]) &&
            ! trs[i].style.backgroundColor) {
 		  
          // get all the cells in this row...
          var tds = trs[i].getElementsByTagName("td");
        
          // and iterate through them...
          for (var j = 0; j < tds.length; j++) {
        
            var mytd = tds[j];

            // avoid cells that have a class attribute
            // or backgroundColor style
            if (! hasClass(mytd) &&
                ! mytd.style.backgroundColor) {
        
              mytd.style.backgroundColor =
                even ? evenColor : oddColor;
            
            }
          }
        }
        // flip from odd to even, or vice-versa
        even =  ! even;
      }
    }
  }
  
 // --------------------------------------------------------------------

//						Initialize Functions
//						set onLoad of each page

//---------------------------------------------------------------------
  
  function initScripts(){
	  stripe(stripedTable);
	  //initFocus();	  
	  }
  
  
  