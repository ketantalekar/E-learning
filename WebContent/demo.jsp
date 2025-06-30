<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<SCRIPT language="javascript">
function add(type) {

	//Create an input type dynamically.
	var x = document.getElementById("text1");
	console.log(x);
	
	x++;
	var element = document.createElement("input");

	//Assign different attributes to the element.
	element.setAttribute("type", type);
	element.setAttribute("value", x);
	element.setAttribute("name", x); //this will add name attri to the input field


	var foo = document.getElementById("fooBar");

	//Append the element in page (in span).
	foo.appendChild(element);
	document.getElementById("text1").innerHTML = x; 

}
</SCRIPT>


<FORM>
<H2>Dynamically add element in form.</H2>
Select the element and hit Add to add it in form.
<BR/>
<SELECT name="element">
	<OPTION value="button">Button</OPTION>
	<OPTION value="text">Textbox</OPTION>
	<OPTION value="radio">Radio</OPTION>
</SELECT>
<input type="hidden" value="0" name="text1" id="text1">
<INPUT type="button" value="Add" onclick="add(document.forms[0].element.value)"/>

<span id="fooBar">&nbsp;</span>

</FORM>
</body>
</html>