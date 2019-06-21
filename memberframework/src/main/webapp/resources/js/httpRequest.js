function getXMLHttpRequest(){
	if(window.ActiveXObject){//인터넷익스플로어냐???
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e1){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");//7이하 정도
			}catch(e2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest(); //이친구가 서버하고 통신할수 있는 자바스크립트객체
	}else{
		return null;
	}
}

var httpRequest = null;

function sendRequest(url, params, callback, method){
	httpRequest = getXMLHttpRequest();
	
	var httpMethod = method ? method : 'GET'; //method의 값이 있냐
	if(httpMethod != 'GET' && httpMethod != 'POST'){ //오타났을 경우
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if(httpMethod == 'GET' && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	//alert("method == " + httpMethod + "\turl == " + httpUrl + "\tparam == " + httpParams);
	httpRequest.open(httpMethod, httpUrl, true); // true 비동기 방식 false 동기 방식 저 method로 저 url을 연결
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;
	//alert(httpMethod == 'POST' ? httpParams : null);
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}