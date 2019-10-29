public class Domino_API {
	// Define Static Variables
	public String DOMINOAPI_ENDPOINT = 'https://mobile.kincare.com.au/sfdomtest.nsf/SFDomWS?OpenWebService';
	public String DOMINOAPI_USER = 'wst';
	public String DOMINOAPI_PASSWORD = 'kincare';
	public String stringRequest{get;set;}
	public String stringResponse{get;set;}

	private Http http = new Http();
	private HttpRequest httpRequest;
	private Map <String, String> httpRequestHeaders;
	private HttpResponse httpResponse;


	public Domino_API() {

	}


	public String sendRequest()
	{
		httpRequest = new HttpRequest();
		httpRequest.setMethod('POST');
		httpRequest.setEndpoint(DOMINOAPI_ENDPOINT);
		httpRequest.setTimeout(60000);
		Blob headerValue = Blob.valueOf(DOMINOAPI_USER + ':' + DOMINOAPI_PASSWORD);
		String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
		httpRequestHeaders = new Map <String, String>();
		httpRequestHeaders.put('Content-Type', 'text/xml;charset=UTF-8');
		httpRequestHeaders.put('SOAPAction', 'SFXMLDATA');
		httpRequestHeaders.put('Authorization', authorizationHeader);
		for (String headerKey : httpRequestHeaders.keySet())
		{
			httpRequest.setHeader(headerKey, httpRequestHeaders.get(headerKey));
		}

		String requestBody;
		requestBody =  '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:DefaultNamespace">';
		requestBody += '\t' + '<soapenv:Header/>' + '\n';
		requestBody += '\t' + '<soapenv:Body>' + '\n';
		requestBody += '\t\t' +'<SFXMLDATA soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">' + '\n';
		requestBody += '\t\t\t' +'<XMLDATA xsi:type="xsd:string">' + '\n';
		requestBody += '\t\t\t\t' + stringRequest + '\n';
		requestBody += '\t\t\t' +'</XMLDATA>' + '\n';
		requestBody += '\t\t' +'</SFXMLDATA>' + '\n';
		requestBody += '\t' +'</soapenv:Body>' + '\n';
		requestBody +='</soapenv:Envelope>';
		httpRequest.setBody(requestBody);

/*
		if (CHRIS21API_ENABLELOGGING == true)
		{
			logRequest(rule);
		}
		*/

		httpResponse = http.send(httpRequest);
/*
		if (CHRIS21API_ENABLELOGGING == true)
		{
			logResponse();
		}
*/
		stringResponse = httpResponse.getBody();
		return httpResponse.getBody();
	}




}